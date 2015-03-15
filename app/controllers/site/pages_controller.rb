class Site::PagesController < SiteController
  before_action :set_facade

  def index
    render :show
  end

  def show
  end

  private

  def set_facade
    slug = params[:id]
    slug = 'pages' if slug.nil?

    @facade = Site::PageFacade.new slug
  end
end
