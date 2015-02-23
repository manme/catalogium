class Admin::CategoryFacade
  attr_reader :categories
  attr_reader :category

  def initialize
    @category = Category.new
  end

  def all
    @categories = Category.all
  end

  def find id
    @category = Category.find id
  end

  def create params
    @category = Category.new params
    @category.save
  end

  def update params
    @category.update params
  end

  def destroy
    @category.destroy
  end
end
