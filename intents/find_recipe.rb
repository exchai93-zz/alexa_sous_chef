require './lib/recipe'

intent "FindRecipe" do
  # Stubbed API
  recipe = Recipe.new(JSON.parse(File.read("recipe_json.rb")))
  # API
  # formatted_recipes = alexa_request.session_attribute('recipes')
  # choice = alexa_request.slot_value('Recipe').to_i - 1
  # recipe_id = formatted_recipes[choice].values.pop.to_i
  # recipe = Recipe.find(recipe_id)
  response_text = "Found " + recipe.name
  respond(response_text: response_text, session_attributes: { recipe: recipe.contents })
end
