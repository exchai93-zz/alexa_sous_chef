require 'sinatra'
require 'json'
require_relative './lib/alexa/request'
require_relative './lib/alexa/response'

post '/' do
  alexa_request = Alexa::Request.new(request)
  response_text = "Found #{alexa_request.slot_value("Recipe")}"
  Alexa::Response.build(response_text)
end
