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
    session[:high_taxes] = true
    addApprovalRating(-20, session)
  elsif result == :people_approve
    addApprovalRating(20, session)
    session[:high_taxes] = true
    session[:no_taxes] = true
  elsif result == :mercenaries
    session[:army_size] += 1000
    return spendMoney(75000, session)
  elsif result == :nothing
    
  elsif result == :small_bribe
    session[:money] += 10000
  elsif result == :public_outrage
    addApprovalRating(-30, session)
    if session[:day] == 7
      session[:day7_outrage] = true
    elsif session[:day] == 12
      session[:day12_outrage] = true
    end
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
  elsif result == :great_victory
    session[:army_size] -= 1000
    addApprovalRating(20, session)
  elsif result == :city_holds
    spendResult = spendMoney(30000, session)
    if spendResult == :ok
      session[:army_size] -= 500
    else
      return spendResult
    end
  elsif result == :city_lost
    session[:population] -= 7500
    addApprovalRating(-20, session)
  elsif result == :desperate_measures
    session[:money] += 100000
    addApprovalRating(-40, session)
    session[:day13_outrage] = true
  elsif result == :daystobattle5
    
  elsif result == :encouraged_recruitment
    spendResult = spendMoney(5000, session)
    if spendResult == :ok
      session[:army_size] += 1000
    else
      return spendResult
    end
  elsif result == :good_recruitment
    session[:army_size] += 500
  elsif result == :ally_supports
    session[:army_size] += 1000
  elsif result == :ally_mercenaries
    spendResult = spendMoney(80000, session)
    if spendResult == :ok
      session[:army_size] += 1000
    else
      return spendResult
    end
  elsif result == :conscription_en_masse
    session[:army_size] += 3500
    addApprovalRating(-30, session)
  elsif result == :conscription_for_benefits
    session[:army_size] += 1500
    addApprovalRating(-30, session)  
  elsif result == :citizen_militias
    spendResult = spendMoney(90000, session)
    if spendResult == :ok
      session[:army_size] += 1000
    else
      return spendResult
    end  
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
  elsif day == 12
    addEventId(14, session)
  elsif day == 13
    addEventId(15, session)
  elsif day == 14
    addEventId(16, session)
  elsif day == 15
    addEventId(17, session)
  elsif day == 16
    if session[:allies].length > 0
      addEventId(18, session) # we have an ally!
    else
      addEventId(19, session) # we don't have an ally!
    end
  elsif day == 17
    addEventId(20, session)
  elsif day == 18
    addEventId(21, session)
  elsif day == 19
    addEventId(22, session)
  elsif day == 20
    addEventId(23, session)
  elsif day == 21 and session[:army_size] > 7000
    addEventId(24, session)
  elsif day == 21
    addEventId(25, session)
  end
  
  flavor_msgs = [13]
  
  if session[:approval_rating] <= 10
    addEventId(10, session)
  end
end

def parseMsg(msg, session)
  msg.gsub("(name)", session[:name]).gsub("(country)", session[:country]).gsub("(enemy_country)", session[:enemy_country]).gsub("(ally_country)", session[:ally_country]).gsub("(money)", session[:money].to_s).gsub("(currency)", session[:currency]).gsub("(any_country)", [session[:country],session[:ally_country],session[:enemy_country]].sample).gsub("(friendly)", [session[:country],session[:ally_country]].sample)
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