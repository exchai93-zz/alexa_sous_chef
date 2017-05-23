require 'recipe'

RSpec.describe Recipe do
  describe '#cooking_time' do
    it 'returns the cooking_time_min of the recipe' do
      cooking_time_min = "15"
      client = double("Net::HTTP", get: File.read("sample_json.rb"))
      recipe = described_class.new('Baked Lemon Snapper', client)

      expect(recipe.cooking_time_min).to eq cooking_time_min
    end

  end
end
