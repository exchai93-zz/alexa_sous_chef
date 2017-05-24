require 'sinatra'
require 'json'
require_relative './lib/alexa/request'
require_relative './lib/alexa/response'

post '/' do
  alexa_request = Alexa::Request.new(request)

  if alexa_request.intent_name == "FindRecipe"
    recipe_name = alexa_request.slot_value("Recipe")
    # recipe = File.read("sample_json.rb")
    response_text = "Found" + recipe_name
    return Alexa::Response.build(response_text: response_text, session_attributes: { recipeName: recipe_name })
  end
end
