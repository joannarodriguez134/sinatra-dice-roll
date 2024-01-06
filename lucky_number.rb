require "sinatra" # includes methods get, post, patch, delete
require "sinatra/reloader" # automatically reload without shutting down and restarting server

require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')



get("/howdy") do
  return "Hello world" # whatever you return is the response for the HTTP request
end

# argument in parantheses is the resource path, and get method is put in a do block

# get ("/") do
#   # lucky_num = rand(100)
#   # return "Your lucky number is #{lucky_num}"

#   # dice_link = "http://obscure-adventure-5gqvw979gjvghv76w-4567.app.github.dev/dice/2/6"

#   "<a href=http://obscure-adventure-5gqvw979gjvghv76w-4567.app.github.dev/dice/2/6>Roll Two 6-sided die</a>

#   <a href=http://obscure-adventure-5gqvw979gjvghv76w-4567.app.github.dev/dice/2/10>Roll Two 10-sided die</a>

#   <a href=http://obscure-adventure-5gqvw979gjvghv76w-4567.app.github.dev/dice/1/20>Roll 1 20-sided die</a>

#   <a href=http://obscure-adventure-5gqvw979gjvghv76w-4567.app.github.dev/dice/5/4>Roll 5 4-sided die</a>"
# end


get("/") do
  erb(:elephant)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end


get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end


get("/dice/2/6") do

  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  # w the @ it becomes a instance variable rather than a local variable
	
  erb(:two_six, { :layout => :wrapper })
end

# To do: GET /dice/2/10 (simulate two 10-sided dice)

get ("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_ten, { :layout => :wrapper })
end

# GET /dice/1/20 (simulate one 20-sided die)

get ("/dice/1/20") do
  first_die = rand(1..20)

  sum = first_die

  @outcome = "You rolled a #{first_die} for a total of #{sum}"
  
  erb(:one_ten, { :layout => :wrapper })
end

# GET /dice/5/4 (simulate five 4-sided dice)

get ("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)

  sum = first_die + second_die + third_die + fourth_die + fifth_die

  @outcome = "Your sum is #{sum}"

  erb(:five_four, { :layout => :wrapper })
end
