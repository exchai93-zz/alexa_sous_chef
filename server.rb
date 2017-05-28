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

    # alexa_request = Alexa::Request.new(request)

    # if alexa_request.type == 'LaunchRequest'
    #   return respond_with_intro(alexa_request)
    # end
    #
    # case alexa_request.intent_name
    # # when "SearchRecipes"
    # #   respond_with_recipes(alexa_request)
    # when "FindRecipe"
    #   respond_with_recipe_name(alexa_request)
    # when "Ingredients"
    #   respond_with_ingredients(alexa_request)
    # when "Steps"
    #   respond_with_step(alexa_request)
    # when "AMAZON.HelpIntent"
    #   respond_with_help(alexa_request)
    # when "AMAZON.StopIntent"
    #   respond_with_stop(alexa_request)
    # when "AMAZON.StartOverIntent"
    #   respond_with_start_over(alexa_request)
    # end
  end


    # def respond_with_intro(alexa_request)
    #   response_text = 'Hello Chef. Today, I will be helping you in the kitchen. What would you like to cook? If you tell me an ingredient, I will load some randomized recipes for you. To select a recipe, please specify the number. You can then ask me for the ingredients and the preparation steps. Say help and I will be right there with you.'
    #   return Alexa::Response.build(response_text: response_text)
    # end
    #
    # def respond_with_help(alexa_request)
    #   response_text = "Here are some things you could say: Read ingredients, start cooking, start over, next or repeat."
    #   return Alexa::Response.build(response_text: response_text)
    # end
    #
    # def respond_with_stop(alexa_request)
    #   response_text = "Sous Chef successfully ended."
    #   return Alexa::Response.build(response_text: response_text, end_session: true)
    # end
    #
    # def respond_with_start_over(alexa_request)
    #   response_text = "Starting over... you can either search for a new recipe or end the session."
    #   return Alexa::Response.build(response_text: response_text, session_attributes: {} )
    # end
end
