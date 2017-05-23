module Alexa
  class Response < Hash
    def initialize
      self[:version] = '1.0'
      self[:response] = Hash.new
      self[:response][:outputSpeech] = Hash.new
      self[:response][:outputSpeech][:type] = "PlainText"
      self[:response][:outputSpeech][:text] = "Hello World"
    end

    def self.build
      new.to_json
    end
  end
end
