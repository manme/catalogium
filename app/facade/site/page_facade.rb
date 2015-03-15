class Site::PageFacade
  attr_reader :page

  def initialize slug
    @page = Page.find_by(slug: slug)
  end
end
