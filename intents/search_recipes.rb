require './lib/recipe'

intent "SearchRecipes" do
    ingredients = ['One', 'Two', 'Three'].inject([]) do |ingredients, ingredient_number|
      ingredient = request.slot_value("Ingredient#{ ingredient_number }")
      ingredient ? ingredients + [ingredient.capitalize] : ingredients
    end

    unavailable_ingredients = Ingredients.unavailable(ingredients)

    if unavailable_ingredients.empty?
      # Stubbed API
      # queried_recipes = JSON.parse(File.read('search_json.rb'))['recipes']['recipe']
      # formatted_recipes = queried_recipes.map { |recipe| {recipe['recipe_name'] => recipe['recipe_id']} }
      # API
      queried_recipes = Recipe.search(ingredients, 5)

      respond(response_text: Recipe.format_response(queried_recipes), session_attributes: { recipes: queried_recipes })
    else
      respond(response_text: "I'm afraid I can't find recipes with the following ingredients: #{unavailable_ingredients}. Please choose your ingredients again.")
    end
end
