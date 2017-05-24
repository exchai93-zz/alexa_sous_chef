require 'sinatra'
require 'json'
require_relative './lib/alexa/request'
require_relative './lib/alexa/response'

post '/' do
  alexa_request = Alexa::Request.new(request)

  if alexa_request.intent_name == "FindRecipe"
    recipe_name = alexa_request.slot_value("Recipe")
    response_text = "Found " + recipe_name
    return Alexa::Response.build(response_text: response_text, session_attributes: { recipeName: recipe_name })
  end

    if alexa_request.intent_name == 'Ingredients'
      recipe_name = alexa_request.session_attribute("recipeName")
      read = alexa_request.slot_value("Read")
      recipe = JSON.parse(File.read("sample_json.rb"))

      if alexa_request.slot_value("Read") == "read ingredients"
        recipe_ingredients = recipe['recipe']['ingredients']['ingredient']['ingredient_description']
        response_text = "Here are the ingredients: " + recipe_ingredients
      end

      return Alexa::Response.build(response_text: response_text, session_attributes: { recipeName: recipe_name} )
    end
end
