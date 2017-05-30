require 'ingredients'

RSpec.describe Ingredients do
  let(:recipe_file) { JSON.parse(File.read('recipe_json.rb'))}
  let(:recipe_ingredients) { ['1 1/2 lbs snapper fillets', '3 tbsps lemon rind, finely chopped'] }
  subject(:ingredients) { described_class.new(recipe_file) }

  it 'contatins formatted ingredients' do
    expect(ingredients.list).to eq recipe_ingredients
  end

  describe '#all' do
    it 'return all ingredients as a string' do
      expect(ingredients.all).to eq recipe_ingredients.join(', ')
    end
  end

  describe '#get' do
    it 'returns the first ingredient when 0' do
      expect(ingredients.get(0)).to eq recipe_ingredients.first
    end

    it ' returns the second ingredient when 1' do
      expect(ingredients.get(1)).to eq recipe_ingredients.last
    end

  end
end
