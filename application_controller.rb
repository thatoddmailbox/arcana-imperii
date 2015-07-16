require 'bundler'
Bundler.require

require_relative "models/events.rb"
require_relative "models/event_handler.rb"

class MyApp < Sinatra::Base
  use Rack::Session::Cookie, :key => 'rack.session', :path => '/', :secret => 'thisissecret'
  
  get '/' do
    erb :index
  end
  get '/start' do
    session[:name] = "Ruler"
    session[:country] = "the Democratic People's Republic of Something"
    session[:enemy_country] = "the Undemocratic People's Republic of Nothing"
    session[:ally_country] = "the Moderately Democratic People's Republic of Anything"
    session[:money] = 100000
    session[:currency] = "Monies"
    session[:army_size] = 500
    session[:approval_rating] = 100
    session[:population] = 3000000
    session[:day] = 0
    session[:events] = {}
    session[:allies] = []
    session[:enemies] = []
    session[:pauseDay] = false
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
      
      if day == 1
        addEventId(1, session)
      elsif day == 2
        addEventId(2, session)
      elsif day == 3
        addEventId(3, session)
      end
    end
    if session[:pauseDay]
      session[:pauseDay] = false
    end
    @eventArrayOutput = ""
    if session[:events].length > 0
      session[:events].each do |sessionEventId, eventId|
        event = $events[eventId]
        parsedMsg = event[:message]
        parsedMsg = parseMsg(parsedMsg, session)
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
    
    handle_result(result, session)
    
    session[:events].delete(sessionEventId)
    
    session[:pauseDay] = true
    
    parseMsg($messages[result], session)
  end
  
  helpers do
    def h(text)
      Rack::Utils.escape_html(text)
    end
  end

end