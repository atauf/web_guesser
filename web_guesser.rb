require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do
	"The SECRET NUMBER is #{SECRET_NUMBER}"
end