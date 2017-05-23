module Alexa
  class Response < Hash
    def initialize(response_text, session_attributes, end_session)
      self[:version] = '1.0'
      self[:sessionAttributes] = session_attributes unless session_attributes.empty?
      self[:response] = Hash.new
      self[:response][:outputSpeech] = Hash.new
      self[:response][:outputSpeech][:type] = "PlainText"
      self[:response][:outputSpeech][:text] = response_text
      self[:response][:shouldEndSession] = end_session if end_session
    end

    def self.build(response_text = "Hello Chef", session_attributes = {}, end_session = false)
      new(response_text, session_attributes, end_session).to_json
    end
  end
end
