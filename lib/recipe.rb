require 'net/http'

class Recipe
  def initialize(recipe = JSON.parse(File.read('sample_json.rb')))
    @recipe = recipe
  end
end
