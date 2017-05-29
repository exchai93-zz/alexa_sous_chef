require './lib/recipe'

intent "FindRecipe" do
  available_choices = %w(1 2 3 4 5)
  # Stubbed API
  recipe = Recipe.new(JSON.parse(File.read("recipe_json.rb")))
  # API
  # formatted_recipes = alexa_request.session_attribute('recipes')
  # choice = alexa_request.slot_value('Recipe').to_i - 1
  # recipe_id = formatted_recipes[choice].values.pop.to_i
  # recipe = Recipe.find(recipe_id)

  if available_choices.include? request.slot_value('Recipe')
    response_text = "Found " + recipe.name
    respond(response_text: response_text, session_attributes: { recipe: recipe.contents })
  else
    response_text = "Sorry, that is not a valid choice. Please pick from choices 1 to 5."
    respond(response_text: response_text)
  end
end
