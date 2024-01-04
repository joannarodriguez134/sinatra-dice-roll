require "sinatra" # includes methods get, post, patch, delete

get("/howdy") do
  return "Hello world" # whatever you return is the response for the HTTP request
end

# argument in parantheses is the resource path, and get method is put in a do block
