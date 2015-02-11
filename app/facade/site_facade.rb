class SiteFacade
  def initialize
    @top_menu = TopMenu.active
    @category_menu = MenuCategory.active
  end
end
