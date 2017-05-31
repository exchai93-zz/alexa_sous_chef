require 'dotenv/load'
require 'net/http'
require 'fatsecret'
require_relative './ingredients'

FatSecret.init(ENV["FATSECRET_KEY"],ENV["FATSECRET_SECRET"])

class Recipe
  INGREDIENTS = File.read('./lib/ingredients.txt').each_line.inject([]) { |memo, line| memo << line.strip }

  attr_reader :contents, :ingredients

  def initialize(contents)
    @contents = contents
    @ingredients = Ingredients.new(contents)
  end

  def self.search(ingredient, number, api = FatSecret)
    query = api.search_recipes(ingredient.join(" "), number)
    query['recipes']['recipe'].map! { |recipe| {recipe['recipe_name'] => recipe['recipe_id']} }
    query['recipes']['recipe']
  end

  def self.find(number, api = FatSecret)
    contents = api.recipe(number)
    new(add_stepNumber(contents))
  end

  def self.unavailable_ingredients(ingredients)
    ingredients.reject { |ingredient| INGREDIENTS.include?(ingredient) }
  end

  def name
    contents['recipe']['recipe_name']
  end

  # def ingredients
  #   contents['recipe']['ingredients']['ingredient'].map {|ingredient| ingredient['ingredient_description']}
  # end

  def step(input)
    increment_step if input == 'next'
    get_preparation_step
  end

  private

  def increment_step
    contents['stepNumber'] += 1
  end

  def self.add_stepNumber(contents)
    contents['stepNumber'] = 0
    return contents
  end

  def get_preparation_step
    stepNumber = contents['stepNumber']
    contents['recipe']['directions']['direction'][stepNumber]['direction_description']
  end

end
