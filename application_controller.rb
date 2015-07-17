require 'bundler'
Bundler.require

require_relative "models/events.rb"
require_relative "models/event_handler.rb"
require_relative "models/newspaper.rb"

class MyApp < Sinatra::Base
  use Rack::Session::Cookie, :key => 'rack.session', :path => '/', :secret => 'thisissecret'
  
  get '/' do
    erb :index
  end
  
  get '/setup' do
    erb :setup
  end
  
  get '/newspaper' do
    generateHeadlines(session).inspect
  end
  
  post '/start' do
    isError = false
    errors = ""
    
    if params.include? :your_name or params[:your_name] == ""
      errors += "Please enter your name!<br />"
      isError = true
    end
    if params.include? :nation_name or params[:nation_name] == ""
      errors += "Please enter your nation's name!<br />"
      isError = true
    end
    if params.include? :enemy_name or params[:enemy_name] == ""
      errors += "Please enter your enemy's name!<br />"
      isError = true
    end
    if params.include? :ally_name or params[:ally_name] == ""
      errors += "Please enter your ally's name!<br />"
      isError = true
    end
    if params.include? :currency_name or params[:currency_name] == ""
      errors += "Please enter your currency's name!<br />"
      isError = true
    end
    
    if isError
      return errors
    end
    
    session[:name] = params[:your_name]#"Ruler"
    session[:country] = params[:nation_name]#"the Democratic People's Republic of Something"
    session[:enemy_country] = params[:enemy_name]#"the Undemocratic People's Republic of Nothing"
    session[:ally_country] = params[:ally_name]#"the Moderately Democratic People's Republic of Anything"
    session[:currency] = params[:currency_name]#"Monies"
    session[:money] = 100000
    session[:army_size] = 500
    session[:approval_rating] = 100
    session[:population] = 3000000
    session[:day] = 0
    session[:events] = {}
    session[:allies] = []
    session[:enemies] = []
    session[:pauseDay] = false
    session[:high_taxes] = false
    session[:no_taxes] = false
    session[:status] = "playing"
    return redirect to("/game")
  end
  
  get '/game' do
    if session[:status] == "lost"
      return erb :end
    end
    if session[:events].length == 0 and not session[:pauseDay]
      session[:day] += 1
      
      day = session[:day]
      
      addEvents(day, session)
    end
    if session[:pauseDay]
      session[:pauseDay] = false
    end
    @eventArrayOutput = ""
    if session[:events].length > 0
      first_time = true
      session[:events].each do |sessionEventId, eventId|
        event = $events[eventId]
        parsedMsg = event[:message]
        parsedMsg = parseMsg(parsedMsg, session)
        if not first_time
          @eventArrayOutput += ", "
        else
          first_time = false
        end
        @eventArrayOutput += "{sei:#{sessionEventId}, msg:#{jsString(parsedMsg)}, choices:#{jsArray(event[:choices].keys)}}"
      end
    end
    erb :game
  end
  
  post '/handle_event' do
    sessionEventId = params[:sei].to_i
    eventId = session[:events][sessionEventId]
    event = $events[eventId]   
    choice = params[:choice]
    
    result = event[:choices][choice]
    
    didItWork = handle_result(result, session)
    
    if didItWork == :ok
      session[:events].delete(sessionEventId)
      session[:pauseDay] = true
    end
    
    message = $messages[result]
    
    if didItWork == :over_spend
      message = $message[:over_spend]
    end
    
    parseMsg(message, session)
  end

  post '/newname' do
    newName = params[:newName]
    whichName = params[:whichName]
    
    if session[:money] >= 100
      session[:money] -= 100
      if whichName == "country"
        session[:country] = newName
      elsif whichName == "own"
        session[:name] = newName
      elsif whichName == "currency"
        session[:currency] = newName        
      end
      session[:pauseDay] = true
      return "Your name has been changed."
    else
      session[:pauseDay] = true
      return "You don't have enough money."
    end
  end
  
  helpers do
    def h(text)
      Rack::Utils.escape_html(text)
    end
    def p(num)
      numStr = num.to_s
      if num < 1000
        return numStr
      end
      newNumStr = ""
      time = 1
      (numStr.length - 1).downto(0) do |i|
        newNumStr = numStr[i] + newNumStr
        time += 1
        if time == 4 and i != 0
          newNumStr = "," + newNumStr
          time = 1
        end
      end
      return newNumStr
    end
  end

end