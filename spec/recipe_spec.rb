require 'recipe'

RSpec.describe Recipe do
  let(:recipe_file) { JSON.parse(File.read('recipe_json.rb')) }
  let(:search_file ) { JSON.parse(File.read('search_json.rb')) }
  let(:fat_secret) { double(:fat_secret, recipe: recipe_file, search_recipes: search_file)}
  let(:ingredients) { double(:ingredients, list: ['1 1/2 lbs snapper fillets', '3 tbsps lemon rind, finely chopped'])}
  let(:ingredients_class) { double(:ingredients_class, new: ingredients) }
  subject(:recipe) { described_class.find(91, fat_secret) }

  it 'creates an instance of the Ingredient class with the contents of the recipe' do
    expect(ingredients_class).to receive(:new).with(recipe_file).and_return(ingredients)
    recipe = described_class.new(recipe_file, ingredients_class)
    expect(recipe.ingredients).to eq ingredients
  end

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
