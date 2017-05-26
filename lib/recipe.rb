require 'dotenv/load'
require 'net/http'
require 'fatsecret'

FatSecret.init(ENV["FATSECRET_KEY"],ENV["FATSECRET_SECRET"])


class Recipe

  attr_reader :contents

  def initialize(contents)
    @contents = contents
  end

  def self.search(ingredient, number, api = FatSecret)
    query = api.search_recipes(ingredient, number)
    query['recipes']['recipe'].map! { |recipe| {recipe['recipe_name'] => recipe['recipe_id']} }
    query['recipes']['recipe']
  end


  def self.find(number, api = FatSecret)
    contents = api.recipe(number)
    new(add_stepNumber(contents))
  end

  def name
    contents['recipe']['recipe_name']
  end

  def ingredients
    contents['recipe']['ingredients']['ingredient'].map {|ingredient| ingredient['ingredient_description']}.join(', ')
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
    return contents
  end
end
