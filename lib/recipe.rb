require 'dotenv/load'
require 'net/http'
require 'fatsecret'

# FatSecret.init(ENV["FATSECRET_KEY"],ENV["FATSECRET_SECRET"])


class Recipe

  attr_reader :contents
  # class << self; attr_accessor :stepNumber end
  # Recipe.stepNumber = 0


  def initialize(contents)
    @contents = contents
  end

  def self.find(number, api = FatSecret)
    contents = api.recipe(number)
    new(add_stepNumber(contents))
  end

  def name
    contents['recipe']['recipe_name']
  end

  def start_cooking_step
    stepNumber = contents['stepNumber']
    contents['recipe']['directions']['direction'][stepNumber]['direction_description']
  end

  def step(input)
    increment_step if input == 'next'
    stepNumber = contents['stepNumber']
    contents['recipe']['directions']['direction'][stepNumber]['direction_description']
  end

  private

  def increment_step
    contents['stepNumber'] += 1
  end

  def self.add_stepNumber(contents)
    contents['stepNumber'] = 0
  end


end
