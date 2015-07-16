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
    session[:money] = 100000
    session[:currency] = "Monies"
    session[:army_size] = 100
    session[:approval_rating] = 100
    session[:population] = 10000
    session[:day] = 0
    session[:events] = {}
    return redirect to("/game")
  end
  
  get '/game' do
    if session[:events].length == 0
      session[:day] += 1
      
      day = session[:day]
      
      if day == 1
        addEventId(1, session)
      elsif day == 2
        addEventId(2, session)
      end
    end
    @eventArrayOutput = ""
    if session[:events].length > 0
      session[:events].each do |sessionEventId, eventId|
        event = $events[eventId]
        parsedMsg = event[:message]
        parsedMsg = parsedMsg.gsub("(name)", session[:name]).gsub("(country)", session[:country]).gsub("(enemy_country)", session[:enemy_country])
        @eventArrayOutput += "{sei:#{sessionEventId}, msg:#{jsString(parsedMsg)}, choices:#{jsArray(event[:choices].keys)}}"
      end
    end
    erb :game
  end
  
  post '/handle_event' do
    sessionEventId = params[:eventId]
    eventId = session[:events][sessionEventId]
    event = $events[eventId]
    
    
    
    "Something happens here!"
  end
  
  helpers do
    def h(text)
      Rack::Utils.escape_html(text)
    end
  end

end