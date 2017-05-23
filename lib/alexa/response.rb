module Alexa
  class Response < Hash
    def initialize(response_text, session_attributes)
      self[:version] = '1.0'
      self[:sessionAttributes] = session_attributes unless session_attributes.empty?
      self[:response] = Hash.new
      self[:response][:outputSpeech] = Hash.new
      self[:response][:outputSpeech][:type] = "PlainText"
      self[:response][:outputSpeech][:text] = response_text
    end

    def self.build(response_text = "Hello Chef", session_attributes = {})
      new(response_text, session_attributes).to_json
    end
  end
end
