class Site::SiteFacade
  attr_reader :top_menu, :category_menu

  def initialize
    @top_menu = TopMenu.active
    @category_menu = MenuCategory.active
  end
end
