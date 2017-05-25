module Alexa
  # Sends a request to Alexa with JSON object
  class Request

    INTENT_REQUEST_TYPE = "IntentRequest".freeze

    attr_reader :request

    def initialize(sinatra_request)
      @request = JSON.parse(sinatra_request.body.read)
    end

    def slot_value(slot_name)
      request['request']['intent']['slots'][slot_name]['value']
    end

    def session_attribute(attribute_name)
      request['session']['attributes'][attribute_name]
    end

    def intent_name
      return @request["request"]["type"] unless intent_request?
      @request["request"]["intent"]["name"]
    end

    private

    def intent_request?
      @request["request"]["type"] == INTENT_REQUEST_TYPE
    end

  end
end
