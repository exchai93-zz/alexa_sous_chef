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

    # if alexa_request.type == 'LaunchRequest'
    #   return respond_with_intro(alexa_request)
    # end
  end


    # def respond_with_intro(alexa_request)
    #   response_text = 'Hello Chef. Today, I will be helping you in the kitchen. What would you like to cook? If you tell me an ingredient, I will load some randomized recipes for you. To select a recipe, please specify the number. You can then ask me for the ingredients and the preparation steps. Say help and I will be right there with you.'
    #   return Alexa::Response.build(response_text: response_text)
    # end
end
