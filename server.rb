require 'sinatra'
require 'json'
require_relative './lib/alexa/request'
require_relative './lib/alexa/response'

post '/' do
  alexa_request = Alexa::Request.new(request)


  if alexa_request.intent_name == 'FindRecipe'
    respond_with_recipe_name(alexa_request)
  end

  if alexa_request.intent_name == 'Ingredients'
    respond_with_ingredients_details(alexa_request)

    if alexa_request.slot_value("Read") == 'Read ingredients'
      respond_with_read_ingredients(alexa_request)
    end
    Alexa::Response.build(response_text: response_text, session_attributes: { recipeName: recipe_name} )
  end

  if alexa_request.intent_name == 'Steps'
    respond_with_steps(alexa_request)
  end
end

def respond_with_recipe_name(alexa_request)
  recipe_name = alexa_request.slot_value("Recipe")
  response_text = "Found" + recipe_name
  Alexa::Response.build(response_text: response_text, session_attributes: { recipeName: recipe_name })
end

def respond_with_ingredients_details(alexa_request)
  set_recipe_session
  set_slot_value("Read")
  set_recipe_from_JSON
end

def respond_with_read_ingredients
  recipe_ingredients = recipe['recipe']['ingredients']['ingredient']['ingredient_description']
  response_text = "Here are the ingredients: " + recipe_ingredients
end

def respond_with_steps(alexa_request)
  set_recipe_session
  action = set_slot_value("Action")
  set_recipe_from_JSON
  stepNumber = alexa_request.session_attribute("stepNumber") || 0

  end

  if action == 'start cooking'
    start_cooking_response
  end

  if action == 'next'
    next_step_response
  end
  Alexa::Response.build(response_text: response_text, session_attributes: { recipeName: recipe_name, stepNumber: stepNumber })
end


private

def set_recipe_session
  recipe_name = alexa_request.session_attribute("recipeName")
end

def set_recipe_from_JSON
  recipe = JSON.parse(File.read("sample_json.rb"))
end

def set_slot_value(string)
  alexa_request.slot_value(string)
end

def increment_step
  stepNumber += 1
end

def start_cooking_response
  response_text = recipe['recipe']['directions']['direction']['direction_description']
  increment_step
end

def next_step_response
  step = recipe['recipe']['directions'].keys[stepNumber]
  response_text = recipe['recipe']['directions'][step]['direction_description']
  increment_step
end
