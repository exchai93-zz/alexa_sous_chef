require 'sinatra/base'
require 'json'
require_relative './lib/alexa/request'
require_relative './lib/alexa/response'
require_relative './lib/recipe'

class AlexaChef < Sinatra::Base
  FatSecret.init(ENV["FATSECRET_KEY"],ENV["FATSECRET_SECRET"])

  post '/' do
    alexa_request = Alexa::Request.new(request)

    if alexa_request.type == 'LaunchRequest'
      return respond_with_intro(alexa_request)
    end

    if alexa_request.intent_name == 'SearchRecipes'
      return respond_with_recipes(alexa_request)
    end

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

    def respond_with_intro(alexa_request)
      response_text = 'Hello Chef. Today, I will be helping you in the kitchen. What would you like to cook? If you tell me an ingredient, I will load some randomized recipes for you. To select a recipe, please specify the number. You can then ask me for the ingredients and the preparation steps. Say help and I will be right there with you.'
      return Alexa::Response.build(response_text: response_text)
    end

    def respond_with_recipes(alexa_request)
      choice = alexa_request.slot_value('Ingredient')
      # Stubbed API
      queried_recipes = JSON.parse(File.read('search_json.rb'))['recipes']['recipe']
      formatted_recipes = queried_recipes.map { |recipe| {recipe['recipe_name'] => recipe['recipe_id']} }
      # API
      # queried_recipes = Recipe.search(choice, 5)
      response_text = "Here are the recipes " + formatted_recipes.each_with_index.map { |recipe, i| "Recipe number #{i + 1}, #{recipe.keys}" }.flatten.join(', ')
      return Alexa::Response.build(response_text: response_text, session_attributes: { recipes: formatted_recipes })
    end

    def respond_with_recipe_name(alexa_request)
      # Stubbed API
      recipe = Recipe.new(JSON.parse(File.read("recipe_json.rb")))
      # API
      # formatted_recipes = alexa_request.session_attribute('recipes')
      # choice = alexa_request.slot_value('Recipe').to_i - 1
      # recipe_id = formatted_recipes[choice].values.pop.to_i
      # recipe = Recipe.find(recipe_id)
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

    def respond_with_help(alexa_request)
      response_text = "Here are some things you could say: Read ingredients, start cooking, start over, next or repeat."
      return Alexa::Response.build(response_text: response_text)
    end

    def respond_with_stop(alexa_request)
      response_text = "Sous Chef successfully ended."
      return Alexa::Response.build(response_text: response_text, end_session: true)
    end
end
