def addEventId(eventId, session)
  session[:events][session[:events].length] = eventId
end

def handle_result(result, session)
  
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