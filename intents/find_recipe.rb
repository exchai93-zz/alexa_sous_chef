require './lib/recipe'

intent "FindRecipe" do
  available_choices = [1,2,3,4,5]
  user_input = request.slot_value('Recipe').to_i

  if available_choices.include? user_input
    # Stubbed API
    recipe = Recipe.new(JSON.parse(File.read("recipe_json.rb")))
    # API
    # formatted_recipes = request.session_attribute('recipes')
    #
    # recipe_id = formatted_recipes[user_input - 1].values.pop.to_i
    # recipe = Recipe.find(recipe_id)

    response_text = "Found #{recipe.name}. To continue, ask for the ingredoents or the preparation steps"
    respond(response_text: response_text, session_attributes: { recipe: recipe.contents })
  else
    response_text = "Sorry, that is not a valid choice. Please pick from choices 1 to 5."
    respond(response_text: response_text)
  end
end
