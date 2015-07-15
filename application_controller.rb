require 'bundler'
Bundler.require

class MyApp < Sinatra::Base
  use Rack::Session::Cookie, :key => 'rack.session', :path => '/', :secret => 'thisissecret'
  
  get '/' do
    erb :index
  end
  get '/start' do
    session[:name] = "Ruler"
    session[:country] = "Democratic People's Republic of Something"
    session[:money] = 100000
    session[:currency] = "Monies"
    session[:army_size] = 100
    session[:approval_rating] = 100
    return redirect to("/game")
  end
  get '/game' do
    erb :game
  end
  
  helpers do
    def h(text)
      Rack::Utils.escape_html(text)
    end
  end

end