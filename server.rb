require 'sinatra/base'
require 'json'
require './lib/alexa/skill'
require './lib/alexa/request'
require './lib/alexa/response'
require './lib/recipe'

class AlexaChef < Sinatra::Base
  FatSecret.init(ENV["FATSECRET_KEY"],ENV["FATSECRET_SECRET"])

  post '/' do
    Alexa::Handlers.handle(request)
  end
end
