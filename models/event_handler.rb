def addEventId(eventId, session)
  session[:events][session[:events].length] = eventId
end

def handle_result(result, session)
  if result == :generous_donation
    session[:money] += 25000
  elsif result == :influx_of_recruits
    session[:army_size] += 250  
  elsif result == :annexation
    session[:status] = "lost"
  elsif result == :declaration_of_war
    session[:enemies].push(session[:enemy_country])
  elsif result == :ally_aid
    session[:money] += 75000
  elsif result == :ally_declares
    session[:enemies].push(session[:ally_country])
  elsif result == :mobilize
    session[:army_size] += 2000 
  elsif result == :harsh_draft
    session[:army_size] += 3000
    session[:approval_rating] -= 20
  end
end

def parseMsg(msg, session)
  msg.gsub("(name)", session[:name]).gsub("(country)", session[:country]).gsub("(enemy_country)", session[:enemy_country]).gsub("(ally_country)", session[:ally_country]).gsub("(money)", session[:money].to_s).gsub("(currency)", session[:currency])
end

def jsString(str)
  return "\"" + str.gsub("\"", "\\\"") + "\""
end

def jsArray(arr)
  returnStr = "["
  first_time = true
  arr.each do |item|
    if not first_time
      returnStr += ", "
    else
      first_time = false
    end
    returnStr += jsString(item)
  end
  returnStr += "]"
  return returnStr
end