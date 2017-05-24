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
  let(:recipe) { JSON.parse(File.read('sample_json.rb')) }

  describe '#respond_with_recipe_name' do
    it 'returns the recipe name if found' do
      expect(described_class.new(recipe).name).to eq "Baked Lemon Snapper"
    end
  end

end
