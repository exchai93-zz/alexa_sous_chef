require './lib/recipe'

intent "PreparationSteps" do
  recipe = Recipe.new(request.session_attribute('recipe'))
  response_text = recipe.step(request.slot_value("Action"))
  respond(response_text: response_text, session_attributes: { recipe: recipe.contents})
end
