require 'net/http'

class Recipe

  attr_reader :recipe

  def initialize(recipe = JSON.parse(File.read('sample_json.rb')))
    @recipe = recipe
  end

  def name
    recipe['recipe']['recipe_name']
  end

  def start_cooking_step
    recipe['recipe']['directions']['direction']['direction_description']
  end

  def step(number)
    direction = recipe['recipe']['directions'].keys[number]
    recipe['recipe']['directions'][direction]['direction_description']
  end


end
