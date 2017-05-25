require 'dotenv/load'
require 'net/http'
require 'fatsecret'

# FatSecret.init(ENV["FATSECRET_KEY"],ENV["FATSECRET_SECRET"])


class Recipe

  attr_reader :contents

  def initialize(contents)
    @contents = contents
    @stepNumber = 1
  end

  def self.find(number, api = FatSecret)
    new(api.recipe(number))
  end

  def name
    contents['recipe']['recipe_name']
  end

  def start_cooking_step
    contents['recipe']['directions']['direction'][0]['direction_description']
  end

  def step(number)
    contents['recipe']['directions']['direction'][number]['direction_description']
  end


end


# stepNumber = alexa_request.session_attribute("stepNumber") || 0
