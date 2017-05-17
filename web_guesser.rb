require 'sinatra'
require 'sinatra/reloader'

number = rand(101)

get '/' do
# Line Below: renders the ERB template named 'index' and creates a local variable for the template named 'number' which has the same value as the 'number' variable from this server code.
erb :index, :locals => {:number => number}  # the first 'number' is the name of the variable in the index.erb file, the second 'number' is the number variable being referenced in this web_guesser.rb file
end