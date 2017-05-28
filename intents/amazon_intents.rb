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
