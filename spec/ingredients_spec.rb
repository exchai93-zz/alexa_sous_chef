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
      expect(ingredients.all).to eq "Here are the ingredients. #{recipe_ingredients.join(', ')}"
    end
  end

  describe '#get' do
    it 'returns the first ingredient when 0' do
      expect(ingredients.get(0)).to eq recipe_ingredients.first
    end

    it ' returns the a specific response for the last ingredient' do
      expect(ingredients.get(1)).to eq "The last ingredient is #{recipe_ingredients.last}"
    end
  end

  describe '#options' do
    it 'returns a response for the different ways to read out ingredients' do
      expect(ingredients.options).to eq "Would you like to hear the ingredients one at a time or altogether? If you choose the former, say next to hear the next ingredient."
    end
  end
end
