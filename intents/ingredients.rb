require './lib/recipe'

intent "Ingredients" do
  recipe = Recipe.new(request.session_attribute('recipe'))
  response_text = "Here are the ingredients: " + recipe.ingredients
  respond(response_text: response_text, session_attributes: { recipe: recipe.contents })
end
