class Ingredients

  attr_reader :list

  def initialize(contents)
    @list = format(contents)
  end

  def all
    "Here are the ingredients. " + list.join(', ')
  end

  def get(number)
    list[number]
  end

  # def last?
  #   ingredient_number == (recipe.ingredients.count - 1) ? "The last ingredient is #{ingredient}" : ingredient)
  # end

  def options
    "Would you like to hear the ingredients one at a time or altogether? If you choose the former, say next to hear the next ingredient."
  end


  private

  def format(contents)
    contents['recipe']['ingredients']['ingredient'].map {|ingredient| ingredient['ingredient_description']}
  end
end
