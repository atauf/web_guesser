require 'sinatra'
require 'sinatra/reloader'

# Can make this number --> NUMBER (a constant) and set equal to rand(101)
# the number shouldn't change unless the server is restarted
# TRY AFTER testing all other functionality
number = 5


get '/' do
# Line Below: renders the ERB template named 'index' and creates a local variable for the template named 'number' which has the same value as the 'number' variable from this server code.
# throw params.inspect # This line helps to debug what the key/value pair is for the guess
	guess = params["guess"]
	message = check_guess(guess, number)[0]
	backgroundColor = check_guess(guess, number)[1]
	#throw guess #returns nil when no guess has been made
	erb :index, :locals => {:number => number, :message => message, :backgroundColor => backgroundColor}  # the first 'number' is the name of the variable in the index.erb file, the second 'number' is the number variable being referenced in this web_guesser.rb file
end

def check_guess(guess, number)
	if guess != nil
		guess_int = guess.to_i
		if guess_int > number + 5
			message = "Nope, that's way too high!  Guess again!"
			color = 'red'
		elsif guess_int > number
			message = "Close, but still a little too high!  Guess again!"
			color = 'yellow'
		elsif guess_int < number - 5
			message = "Nope, that's way too low!  Guess again!"
			color = 'red'
		elsif guess_int < number
			message = "Close, but still a little too low!  Guess again!"
			color = 'yellow'
		elsif guess_int == number
			message = "THAT'S IT!  NICE WORK!"
			color = 'green'
		else
			#this part doesn't work yet because guess.to_i must be returning a number value
			#can try Integer(guess) and then an ArgumentError will be thrown --> Need Try/Catch block???
			return "You must not understand...you need to guess a NUMBER!  Guess again!"
		end
		return message, color
	end
	message = "Take a guess at what the SECRET NUMBER is!"
	color = 'white'
	return message, color
end