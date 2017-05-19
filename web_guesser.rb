require 'sinatra'
require 'sinatra/reloader'

number = 5
message = "Take a guess at what the SECRET NUMBER is!"

get '/' do
# Line Below: renders the ERB template named 'index' and creates a local variable for the template named 'number' which has the same value as the 'number' variable from this server code.
#	erb :index, :locals => {:number => number, :message => message}  # the first 'number' is the name of the variable in the index.erb file, the second 'number' is the number variable being referenced in this web_guesser.rb file
# throw params.inspect # This line helps to debug what the key/value pair is for the guess
	if params["guess"] != nil
		guess_int = params["guess"].to_i
		if guess_int > number + 5
			message = "Nope, that's way too high!  Guess again!"
		elsif guess_int > number
			message = "Close, but still a little too high!  Guess again!"
		elsif guess_int < number - 5
			message = "Nope, that's way too low!  Guess again!"
		elsif guess_int < number
			message = "Close, but still a little too low!  Guess again!"
		elsif guess_int == number
			message = "THAT'S IT!  NICE WORK!"
		else
			message = "You must not understand...you need to guess a NUMBER!  Guess again!"
		end
	end
	erb :index, :locals => {:number => number, :message => message}  # the first 'number' is the name of the variable in the index.erb file, the second 'number' is the number variable being referenced in this web_guesser.rb file
end

# def check_guess(guess)
	
# end