def getDate(session)
  return "November #{4 + session[:day]}th, 1975"
end

def generateHeadlines(session)
  generic_templates = ["(any_country) announces large reorganization plan!", "Pig wins (any_country) Pageant!", "Victory at the Battle of (any_country)!", "New factory opens up in (friendly).", "(enemy_country)'s minister makes a fool of himself.", "(enemy_country)'s economy reaches record lows.", "Approval rating of (enemy_country)'s leader hits a record low!", "(enemy_country)'s finance minister warns of overinflation!", "(friendly) announces an army reorganization.", "(enemy_country)'s communications infrastructure knocked out by (country).", "(enemy_country) reveals discovery of (country) spies in their government!", "(country) reveals discovery of (enemy_country) spies in their government!", "Millions of (currency) lost in (country) stock exchange failure!", "(name) gives speech on state of the war"]
  
  special_headlines = []
  
  day = session[:day]
  
  if day == 1
    special_headlines.push("(name) ascends to the throne of (country)!");
    special_headlines.push("Largest parade ever in honor of (name)!");
    special_headlines.push("(name) reveals future plans for (country)");
  elsif day == 2
    special_headlines.push("(enemy_country) declares war on (country)!");
    special_headlines.push("(enemy_country)'s minister voted ugliest minister ever");
    special_headlines.push("New book on (enemy_country)'s shortsightedness announced!");
  end
  
  generic_templates = generic_templates.shuffle
  special_headlines = special_headlines.shuffle
  
  final_headlines = []
  
  i = 0
  while final_headlines.length < 3 and special_headlines.length > i do
    final_headlines.push(special_headlines[i])
    i += 1
  end
  
  i = 0
  while final_headlines.length < 3 do
    final_headlines.push(generic_templates[i])
    i += 1
  end
  
  i = 0
  final_headlines.each do |headline|
    parsedStr = parseMsg(headline, session)
    parsedStr = parsedStr[0].upcase + parsedStr[1..parsedStr.length-1]
    final_headlines[i] = parsedStr
    i += 1
  end
  
  return final_headlines
end