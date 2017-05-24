require 'sinatra'
require 'json'
require_relative './lib/alexa/request'
require_relative './lib/alexa/response'

post '/' do
  alexa_request = Alexa::Request.new(request)

  
  if alexa_request.intent_name == "FindRecipe"
    return respond_with_recipe_name(alexa_request)
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

  if alexa_request.intent_name == 'Steps'
    return respond_with_steps(alexa_request)
  end
end

def respond_with_recipe_name(alexa_request)
  recipe_name = alexa_request.slot_value("Recipe")
  response_text = "Found" + recipe_name
  return Alexa::Response.build(response_text: response_text, session_attributes: { recipeName: recipe_name })
end

def respond_with_steps(alexa_request)
  recipe_name = alexa_request.session_attribute("recipeName")
  action = alexa_request.slot_value("Action")
  recipe = JSON.parse(File.read("sample_json.rb"))
  stepNumber = alexa_request.session_attribute("stepNumber") || 0

  if action == 'start cooking'
    response_text = recipe['recipe']['directions']['direction']['direction_description']
    stepNumber += 1
  end

  if action == 'next'
    step = recipe['recipe']['directions'].keys[stepNumber]
    response_text = recipe['recipe']['directions'][step]['direction_description']
    stepNumber += 1
  end
  return Alexa::Response.build(response_text: response_text, session_attributes: { recipeName: recipe_name, stepNumber: stepNumber })
end
