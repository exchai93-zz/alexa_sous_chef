require 'sinatra/base'
require 'json'
require_relative './lib/alexa/request'
require_relative './lib/alexa/response'
require_relative './lib/recipe'

class AlexaChef < Sinatra::Base
  FatSecret.init(ENV["FATSECRET_KEY"],ENV["FATSECRET_SECRET"])

  post '/' do
    alexa_request = Alexa::Request.new(request)

    if alexa_request.intent_name == "FindRecipe"
      return respond_with_recipe_name(alexa_request)
    end

    if alexa_request.intent_name == 'Ingredients'
      return respond_with_ingredients(alexa_request)
    end

    if alexa_request.intent_name == 'Steps'
      return respond_with_step(alexa_request)
    end

    if alexa_request.intent_name == 'AMAZON.HelpIntent'
      return respond_with_help(alexa_request)
    end

    if alexa_request.intent_name == 'AMAZON.StopIntent'
      return respond_with_stop(alexa_request)
    end

  end

  def respond_with_help(alexa_request)
    response_text = "Here are some things you could say: Read ingredients, start cooking, start over, next or repeat."
    return Alexa::Response.build(response_text: response_text)
  end

  def respond_with_stop(alexa_request)
    response_text = "Sous Chef successfully ended."
    return Alexa::Response.build(response_text: response_text, end_session: true)
  end

    def respond_with_recipe_name(alexa_request)
      # recipe = Recipe.find(91)
      recipe = Recipe.new(JSON.parse(File.read("sample_json.rb")))
      response_text = "Found " + recipe.name
      return Alexa::Response.build(response_text: response_text, session_attributes: { recipe: recipe.contents })
    end

    def respond_with_ingredients(alexa_request)
      recipe = Recipe.new(alexa_request.session_attribute('recipe'))
      response_text = "Here are the ingredients: " + recipe.ingredients
      return Alexa::Response.build(response_text: response_text, session_attributes: { recipe: recipe.contents })
    end

    def respond_with_step(alexa_request)
      recipe = Recipe.new(alexa_request.session_attribute('recipe'))
      response_text = recipe.step(alexa_request.slot_value("Action"))
      return Alexa::Response.build(response_text: response_text, session_attributes: { recipe: recipe.contents})
    end
end
