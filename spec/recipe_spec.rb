require 'recipe'

RSpec.describe Recipe do
  let(:recipe_file) { JSON.parse(File.read('sample_json.rb')) }
  let(:fat_secret) { double(:fat_secret, recipe: recipe_file)}
  subject(:recipe) { described_class.find(91, fat_secret) }

  describe '.find' do
    it 'finds the recipe' do
      expect(fat_secret).to receive(:recipe).with(91)
      described_class.find(91, fat_secret)
    end

    it 'creates a new recipe object with the found recipe' do
      expect(described_class).to receive(:new)
      described_class.find(91, fat_secret)
    end
  end

  describe '#name' do
    it 'returns the recipe name if found' do
      expect(recipe.name).to eq "Baked Lemon Snapper"
    end
  end

  describe '#ingredients' do
    it 'returns the ingredients of the recipe' do
      expect(recipe.ingredients).to eq "1 1\/2 lbs snapper fillets"
    end
  end

  describe '#step' do
    context 'user asks for next step' do
      it 'returns the next step' do
        expect(recipe.step('next')).to eq "Go fishing."
      end
    end

    context 'user starts cooking' do
      it 'returns the instructions for the first step' do
        expect(recipe.step('start cooking')).to eq "Preheat oven to 390 °F (200 °C)."
      end
    end
  end
end
