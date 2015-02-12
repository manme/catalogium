class Admin::PageFacade
  attr_reader :pages
  attr_reader :page

  def initialize
    @page = Page.new
  end

  def all
    @pages = Page.all
  end

end
