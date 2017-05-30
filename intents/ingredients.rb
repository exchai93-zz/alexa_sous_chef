require './lib/recipe'

intent "Ingredients" do
  recipe = Recipe.new(request.session_attribute('recipe'))
  method = request.slot_value('Ingredients')

  if method =~ /step || one || next/
    ingredient_number = request.session_attribute('ingredient_number') || 0
    respond(response_text: recipe.ingredients[ingredient_number], session_attribute: { recipe: recipe.contents, ingredient_number: ingredient_number})
  else
    response_text = "Here are the ingredients: " + recipe.ingredients.join(', ')
    respond(response_text: response_text, session_attributes: { recipe: recipe.contents })
  end
end
