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
  end
end

def parseMsg(msg, session)
  msg.gsub("(name)", session[:name]).gsub("(country)", session[:country]).gsub("(enemy_country)", session[:enemy_country]).gsub("(ally_country)", session[:ally_country])
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