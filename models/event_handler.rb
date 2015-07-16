def addEventId(eventId, session)
  session[:events][session[:events].length] = eventId
end

def addApprovalRating(by, session)
  session[:approval_rating] += by
  if session[:approval_rating] < 0
    session[:approval_rating] = 0
  end
  if session[:approval_rating] > 100
    session[:approval_rating] = 100
  end
end

def spendMoney(amount, session)
  if session[:money] >= amount
    session[:money] -= amount
    return :ok
  end
  return :over_spend
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
    session[:allies].push(session[:ally_country])
  elsif result == :mobilize
    session[:army_size] += 2000 
  elsif result == :harsh_draft
    session[:army_size] += 3000
    addApprovalRating(-20, session)
  elsif result == :taxes
    session[:money] += 50000
    addApprovalRating(-20, session)
  elsif result == :people_approve
    addApprovalRating(20, session)
  elsif result == :mercenaries
    session[:army_size] += 1000
    return spendMoney(75000, session)
  elsif result == :nothing
    
  elsif result == :small_bribe
    session[:money] += 10000
  elsif result == :public_outrage
    addApprovalRating(-30, session)
  elsif result == :troops_used_for_people
    addApprovalRating(15, session)
    session[:army_size] -= 500
  elsif result == :revolution
    session[:status] = "lost"
  elsif result == :military_propaganda
    spendResult = spendMoney(1000, session)
    if spendResult == :ok
      session[:army_size] += 500
    else
      return spendResult
    end
  elsif result == :helping_hungry
    spendResult = spendMoney(40000, session)
    if spendResult == :ok
      addApprovalRating(40, session)
    else
      return spendResult
    end        
  elsif result == :people_starving
    session[:population] -= 5000
    addApprovalRating(-10, session)
  end
  
  return :ok
end

def addEvents(day, session)
  if day == 1
    addEventId(1, session)
  elsif day == 2
    addEventId(2, session)
  elsif day == 3
    addEventId(3, session)
  elsif day == 4
    addEventId(4, session)
  elsif day == 5
    addEventId(5, session)
  elsif day == 6
    addEventId(6, session)
  elsif day == 7
    addEventId(7, session)
  elsif day == 8
    addEventId(8, session)
  elsif day == 9
    addEventId(9, session)
  elsif day == 10
    addEventId(11, session)
  elsif day == 11
    addEventId(12, session)
  end
  
  if session[:approval_rating] <= 10
    addEventId(10, session)
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