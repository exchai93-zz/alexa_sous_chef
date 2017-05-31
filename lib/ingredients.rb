class Ingredients

  attr_reader :list

  def initialize(contents)
    @list = format(contents)
  end

  def all
    "Here are the ingredients. #{list.join(', ')}"
  end

  def get(number)
    return last_ingredient if last?(number)
    list[number]
  end

  def options
    "Would you like to hear the ingredients one at a time or altogether? If you choose the former, say next to hear the next ingredient."
  end

  private

  def format(contents)
    contents['recipe']['ingredients']['ingredient'].map {|ingredient| ingredient['ingredient_description']}
  end

  def last_ingredient
    "The last ingredient is #{list.last}"
  end

  def last?(number)
    number == list.count - 1
  end
end
