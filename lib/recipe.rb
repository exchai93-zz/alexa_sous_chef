require 'dotenv/load'
require 'net/http'
require 'fatsecret'

FatSecret.init(ENV["FATSECRET_KEY"],ENV["FATSECRET_SECRET"])


class Recipe

  attr_reader :recipe

  def initialize(recipe)
    @recipe = recipe
  end

  def self.find(number, api = FatSecret)
    new(api.recipe(number))
  end

  def name
    recipe['recipe']['recipe_name']
  end

  def start_cooking_step
    recipe['recipe']['directions']['direction'][0]['direction_description']
  end

  def step(number)
    recipe['recipe']['directions']['direction'][number]['direction_description']
  end


end
