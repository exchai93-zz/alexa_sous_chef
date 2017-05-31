require './lib/recipe'

intent "ListIngredients" do
  recipe = Recipe.new(request.session_attribute('recipe'))
  respond(response_text: recipe.ingredients.options, session_attributes: { recipe: recipe.contents })
end

intent "ListIngredientsTogether" do
  recipe = Recipe.new(request.session_attribute('recipe'))
  respond(response_text: recipe.ingredients.all, session_attributes: { recipe: recipe.contents })
end

intent "ListIngredientsSeparately" do
  recipe = Recipe.new(request.session_attribute('recipe'))
  ingredient_number = request.session_attribute('ingredient_number') || 0
  respond(response_text: recipe.ingredients.get(ingredient_number), session_attributes: { recipe: recipe.contents, ingredient_number: ingredient_number += 1})
end
