class Ingredients

  attr_reader :list

  def initialize(contents)
    @list = format(contents)
  end

  def all
    list.join(', ')
  end

  private

  def format(contents)
    contents['recipe']['ingredients']['ingredient'].map {|ingredient| ingredient['ingredient_description']}
  end
end
