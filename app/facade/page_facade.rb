class PageFacade
  attr_reader :page

  def initialize slug
    if slug.nil?
    else
      @page = Page.find_by(slug: slug)
    end
  end
end
