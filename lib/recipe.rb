require 'net/http'
require 'fatsecret'
FatSecret.init('98aff9ab2f594f0787d955f9323d8316','cf87e9e7155a49a1bebc6d000846da04')
# p FatSecret.recipe(91)


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
