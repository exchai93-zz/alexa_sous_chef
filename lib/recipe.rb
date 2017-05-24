require 'net/http'

class Recipe

  attr_reader :recipe

  def initialize(recipe = JSON.parse(File.read('sample_json.rb')))
    @recipe = recipe
  end

  def name
    recipe['recipe']['recipe_name']
  end

end
