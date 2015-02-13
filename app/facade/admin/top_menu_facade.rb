class Admin::TopMenuFacade
  attr_reader :top_menu
  attr_reader :top_menus

  def initialize
    @top_menu = TopMenu.new
  end

  def all
    @top_menus = TopMenu.all
  end

  def find id
    @top_menu = TopMenu.find id
  end

  def create params
    @top_menu = TopMenu.new params
    @top_menu.save
  end

  def update params
    @top_menu.update params
  end
end
