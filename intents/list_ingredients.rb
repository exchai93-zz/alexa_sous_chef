require './lib/recipe'

intent "ListIngredients" do
  recipe = Recipe.new(request.session_attribute('recipe'))
  method = request.slot_value('Action')

  if method =~(/\w*?(next)|1\w*?/)
    ingredient_number = request.session_attribute('ingredient_number') || 0
    ingredient = recipe.ingredients[ingredient_number]
    response_text = (ingredient_number == (recipe.ingredients.count - 1) ? "The last ingredient is #{ingredient}" : ingredient)
    ingredient_number += 1
    respond(response_text: response_text, session_attributes: { recipe: recipe.contents, ingredient_number: ingredient_number})
  elsif request.session_attribute('ingredient_number').nil?
    respond(response_text: "Would you like to hear the ingredients one at a time or altogether? If you choose the former, say next to hear the next ingredient.", session_attributes: { recipe: recipe.contents })
  else
    response_text = "Here are the ingredients: " + recipe.ingredients.join(', ')
    respond(response_text: response_text, session_attributes: { recipe: recipe.contents })
  end
end
