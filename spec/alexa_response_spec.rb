require 'alexa/response'

RSpec.describe Alexa::Response do
  describe '.build' do
    it 'returns a minimal JSON response' do
      minimal_response = {
        version: "1.0",
        response: {
          outputSpeech: {
            type: "PlainText",
            text: "Hello World"
          }
        }
      }.to_json

      expect(Alexa::Response.build).to eq minimal_response
    end
  end
end
