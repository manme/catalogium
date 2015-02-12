class Admin::PageFacade
  attr_reader :pages
  attr_reader :page

  def initialize
    @page = Page.new
  end

  def all
    @pages = Page.all
  end

  def find id
    @page = Page.find id
  end

  def create params
    @page = Page.new params
    @page.save
  end

  def update params
    @page.update params
  end

  def destroy
    @page.destroy
  end
end
