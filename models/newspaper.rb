require 'date'

def getDate(session)
  date = Date.new(1975, 11, 4 + session[:day])
  th = "th"
  if date.day > 19 and date.day.to_s[-1] == "1"
    th = "st"
  elsif date.day > 19 and date.day.to_s[-1] == "2"
    th = "nd"
  elsif date.day > 19 and date.day.to_s[-1] == "3"
    th = "rd"
  end
  return date.strftime("%A, %B %-d#{th}, %Y")
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
  elsif day == 3
    special_headlines.push("(country) begins preparations for war on (enemy_country)!");
  elsif day == 4 and session[:allies].length > 0
    special_headlines.push("(ally_country) declares war on (enemy_country)!");
    special_headlines.push("(ally_country) announces allyship with (country)!");
  elsif day == 5 and session[:high_taxes] and not session[:no_taxes]
    special_headlines.push("(ally_country) reveals unpopular war tax increase plan!");
  elsif day == 5 and session[:high_taxes] and session[:no_taxes]
    special_headlines.push("(name): 'I will not raise taxes'");
  elsif day == 7 and session[:day7_outrage]
    special_headlines.push("Public outraged at (name)'s response to pacifists");
    special_headlines.push("'We will come back even stronger next time' - Pacifists");
    special_headlines.push("Many calling for (name)'s power to be reduced");
  elsif day == 8
    special_headlines.push("(enemy_country) begins to cross the border of (country)!");  
  elsif day == 12
    special_headlines.push("Hunger is everywhere!");
    if session[:day12_outrage]
      special_headlines.push("(name): 'Let them eat cake!'");      
    end
  elsif day == 13
    if session[:day13_outrage]
      special_headlines.push("(name) repossesses dissendents' property!");
      special_headlines.push("Public furious at (name)");
      special_headlines.push("Dissendents refuse to be silenced by (name)");
    end
  elsif day == 14
    special_headlines.push("Town under siege!")
  elsif day == 15
    special_headlines.push("A call for soldiers of (country)")
  elsif day == 16 and session[:allies].length > 0
    special_headlines.push("(ally_country) donates troops to (country)")
    special_headlines.push("(ally_country) questions allyship with (country)")
  elsif day == 17 and session[:enmasse_consc]
    special_headlines.push("(country) announces changes to recruitment policy")
    special_headlines.push("Public furious in (country) recruitment policy")
    special_headlines.push("(ally_country) concerned about (country)")
  end
  
  generic_templates = generic_templates.shuffle
  special_headlines = special_headlines.shuffle
  
  final_headlines = []
  
  if session[:approval_rating] < 10
    final_headlines = ["(name) is a terrible person", "(country) falls apart", "'Down with (name)!' 'Down with (name)!'"]
  end
  
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