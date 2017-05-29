require 'recipe'

RSpec.describe Recipe do
  let(:recipe_file) { JSON.parse(File.read('recipe_json.rb')) }
  let(:search_file ) { JSON.parse(File.read('search_json.rb')) }
  let(:fat_secret) { double(:fat_secret, recipe: recipe_file, search_recipes: search_file)}
  subject(:recipe) { described_class.find(91, fat_secret) }

  describe '.search' do
    it 'retrieves recipes for the specified ingredient' do
      expect(fat_secret).to receive(:search_recipes).with('pasta', 5)
      described_class.search('pasta', 5, fat_secret)
    end
  end

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
      expect(recipe.ingredients).to eq "1 1\/2 lbs snapper fillets, 3 tbsps lemon rind, finely chopped"
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

  describe '.unavailable_ingredients' do
    it 'filter a list of ingredients, returning the unavailable ones' do
      expect(described_class.unavailable_ingredients(['Pasta','Chicken'])).to be_empty
      expect(described_class.unavailable_ingredients(['Saffron','Cake'])).to eq ['Saffron','Cake']
      expect(described_class.unavailable_ingredients(['Pasta','Cake'])).to eq ['Cake']
    end
  end
end
