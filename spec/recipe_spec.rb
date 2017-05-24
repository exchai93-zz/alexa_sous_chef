require 'recipe'

RSpec.describe Recipe do
  # describe '#cooking_time' do
  #   it 'returns the cooking_time_min of the recipe' do
  #     cooking_time_min = "15"
  #     client = double("Net::HTTP", get: File.read("sample_json.rb"))
  #     recipe = described_class.new('Baked Lemon Snapper', client)
  #
  #     expect(recipe.cooking_time_min).to eq cooking_time_min
  #   end
  let(:recipe_file) { JSON.parse(File.read('sample_json.rb')) }
  subject(:recipe) { described_class.new(recipe_file) }

  describe '#respond_with_recipe_name' do
    it 'returns the recipe name if found' do
      expect(recipe.name).to eq "Baked Lemon Snapper"
    end
  end

  describe '#start_cooking_step' do
    it 'returns the first step of the recipe' do
      expect(recipe.start_cooking_step).to eq "Preheat oven to 390 °F (200 °C)."
    end
  end

end
