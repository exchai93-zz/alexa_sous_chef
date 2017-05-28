require './lib/recipe'

intent "SearchRecipes" do
    choice = request.slot_value('Ingredient')
    # Stubbed API
    queried_recipes = JSON.parse(File.read('search_json.rb'))['recipes']['recipe']
    formatted_recipes = queried_recipes.map { |recipe| {recipe['recipe_name'] => recipe['recipe_id']} }
    # API
    # queried_recipes = Recipe.search(choice, 5)
    response_text = "Here are the recipes " + formatted_recipes.each_with_index.map { |recipe, i| "Recipe number #{i + 1}, #{recipe.keys}" }.flatten.join(', ')
    respond(response_text: response_text, session_attributes: { recipes: formatted_recipes })
end
