module Alexa
  class Response < Hash
    def initialize(response_text)
      self[:version] = '1.0'
      self[:response] = Hash.new
      self[:response][:outputSpeech] = Hash.new
      self[:response][:outputSpeech][:type] = "PlainText"
      self[:response][:outputSpeech][:text] = response_text
    end

    def self.build(response_text="Hello Chef")
      new(response_text).to_json
    end
  end
end
