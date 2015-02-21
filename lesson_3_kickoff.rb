require 'rubygems'
require 'sinatra'
require 'pry'

set :session, true

get '/' do 
  binding.pry
  "From testing action! " + params[:some].to_s #grab value by referencing key
end
#

#Render templates using erb
#Layouts surrund every template unless told not to
#b
get '/test' do
  @error = "Something is wrong" #instance variables from action is 
  #avail to template when you are rendering template

  erb :test
end

#<% %> Ruby code that doesn't need to be printed to HTML
#<%= %> Ruby code that should be printed out to HTML

get '/' do 
  erb :set_name
end 

post '/set_name' do
  sesson[:player_name] = params[:player_name] #use sesson for persistence
  redirect '/game'
end


get '/game' do
  session[:deck] = [['2', 'H'],['3','D']]
  session[:player_cards] = []
  session[:player_cards] << session[:deck].pop
  erb :game
end


set_name.erb
<h4>Set Player Name</h4>

<form action='set_name' method='post'>
  <Name: <input type='text' name=''/>
  <br/>
  <input type='submit' class='btn'/>
</form>

# 1. display contest dynamically:
# 2. instance variables 
# 3. helper methods
# 4. sessions

#handle request and decide whether or not to redirect or render
#POST request: typically you want to redirect and display message
#GET request: typically you want to render




# Chrome fix: (erase line 4)
# use Rack::Session::Cookie, :key => 'rack.session',
#                            :path => '/',
#                            :secret => 'your_secret' 


# get '/home' do
#   "Welcome Home, Broham"
# end

# ###RENDER TEXT
#   #Inline route, rendered directly from action
#   get '/inline' do
#     "Hi, directly, from the action"
#   end 

#   #Render template (contents will be injected in yield tag in layout file)
#   get '/template' do 
#     erb :mytemplate #it looks in views
#   end

#   #nested template (more complicated applications)
#   get '/nested_template' do 
#     erb :"/users/profile" #to looks in views
#   end

# ##REDIRECT
#   #redirect user somewhere else (in this case, to inline action)
#   get '/nodeal' do
#     redirect '/inline'
#   end


# #How to process POST requests:
#   get '/form' do
#     erb :form #it will look for a template called form
#   end 


  # post '/myaction' do
  #   name = params['username']
  #   if name == "" #typcially you would authenticate action or something
  #     puts "Try again"
  #     redirect '/getname'
  #   else
  #     # save into cookie (you could also use a database, or instance var)
  #     # cookies have a limit of 4Kb (don't use multiple decks)
  #     # session is fake persistence varialbe
  #     session[:player_name] = params['username']
  #     redirect '/game' 
  #   end
  # end 


# get '/getname' do
#   erb :form
# end 


