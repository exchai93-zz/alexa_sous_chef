require_relative './request'
require_relative './response'

module Alexa
  class Handlers
    @@intents = {}

    attr_reader :request

    def initialize(request)
      @request = request
    end

    def handle
      instance_eval &registered_intent(request.intent_name)
    end

    class << self
      def intent(intent_name, &block)
        @@intents[intent_name] = block
      end

      def handle(request)
        new(Alexa::Request.new(request)).handle
      end
    end

    def registered_intent(intent_name)
      @@intents[intent_name]
    end

    def respond(response_details)
      Alexa::Response.build(response_details)
    end

    private :request, :registered_intent
  end
end
