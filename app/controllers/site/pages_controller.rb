class Site::PagesController < SiteController
  def index

  end

  def show
    @facade = PageFacade.new params[:id]
  end
end
