intent "LaunchRequest" do
  response_text = 'Hello Chef. Today, I will be helping you in the kitchen. What would you like to cook? If you tell me an ingredient, I will load some recipes for you. You can provide up to three ingredients. For example, chicken, sweet potato, spinach. To select a recipe, please specify the number. You can then ask me for the ingredients and the preparation steps. Say help and I will be right there with you.'
  respond(response_text: response_text)
end

intent "AMAZON.StartOverIntent" do
  response_text = "Starting over... you can either search for a new recipe or end the session."
  respond(response_text: response_text, session_attributes: {} )
end

intent "AMAZON.StopIntent" do
  response_text = "Sous Chef successfully ended."
  respond(response_text: response_text, end_session: true)
end

intent "AMAZON.HelpIntent" do
  response_text = "Here are some things you could say: Read ingredients, start cooking, start over, next or repeat."
  respond(response_text: response_text)
end
