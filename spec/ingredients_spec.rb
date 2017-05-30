require 'ingredients'

RSpec.describe Ingredients do
  let(:recipe_file) { JSON.parse(File.read('recipe_json.rb'))}
  subject(:ingredients) { described_class.new(recipe_file) }


  it 'contatins formatted ingredients' do
    expect(ingredients.list).to eq ['1 1/2 lbs snapper fillets', '3 tbsps lemon rind, finely chopped']
  end
end
