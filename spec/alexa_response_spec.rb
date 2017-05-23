require 'alexa/response'

RSpec.describe Alexa::Response do
  describe '.build' do
    it 'returns a JSON response that ends the session' do
      expected_response = {
        version: "1.0",
        response: {
          outputSpeech: {
            type: "PlainText",
            text: "Hello Chef"
          },
          shouldEndSession: true
        }
      }.to_json

      end_session_response = Alexa::Response.build("Hello Chef", {}, true)
      expect(end_session_response).to eq expected_response
    end

    it 'returns a JSON response with session data if prodivded' do
      expected_response = {
        version: "1.0",
        sessionAttributes: {
          sessionKey: "Session Value"
        },
        response: {
          outputSpeech: {
            type: "PlainText",
            text: "Hello Chef"
          }
        }
      }.to_json

      session_response = Alexa::Response.build("Hello Chef", { sessionKey: "Session Value" })
      expect(session_response).to eq expected_response
    end

    it 'returns a JSON response with a custom string if provided' do
      expected_response = {
        version: "1.0",
        response: {
          outputSpeech: {
            type: "PlainText",
            text: "Custom String"
          }
        }
      }.to_json

      expect(Alexa::Response.build("Custom String")).to eq expected_response
    end

    it 'returns a minimal JSON response otherwise' do
      minimal_response = {
        version: "1.0",
        response: {
          outputSpeech: {
            type: "PlainText",
            text: "Hello Chef"
          }
        }
      }.to_json

      expect(Alexa::Response.build).to eq minimal_response
    end
  end
end
