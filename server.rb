require 'sinatra'
require 'json'
require_relative './lib/alexa/request'
require_relative './lib/alexa/response'

post '/' do
  alexa_request = Alexa::Request.new(request)

  if alexa_request.intent_name == "FindRecipe"
    recipe_name = alexa_request.slot_value("Recipe")
    response_text = "Found" + recipe_name
    return Alexa::Response.build(response_text: response_text, session_attributes: { recipeName: recipe_name })
  end

  if alexa_request.intent_name == 'Steps'
    recipe_name = alexa_request.session_attribute("recipeName")
    action = alexa_request.slot_value("Action")
    recipe = JSON.parse(File.read("sample_json.rb"))
    stepNumber = 1 || alexa_request.session_attribute("stepNumber")

    if alexa_request.slot_value("Action") == 'start cooking'
      response_text = recipe['recipe']['directions']['direction']['direction_description']
      stepNumber += 1
    end

    if alexa_request.slot_value("Action") == 'next'
      step = recipe['recipe']['directions'].keys[stepNumber]
      p recipe['recipe']['directions'].keys

      # p stepNumber
      # direction = recipe['recipe']['directions'].each.select { |direction| p direction; direction[1]['direction_number'].to_i == stepNumber }
      # p direction
      response_text = step['direction_description']
      p response_text
      stepNumber += 1
    end

    return Alexa::Response.build(response_text: response_text, session_attributes: { recipeName: recipe_name, stepNumber: stepNumber })
  end


end
