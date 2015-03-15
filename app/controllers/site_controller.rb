class SiteController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_site

  private

  def set_site
    @site = Site::SiteFacade.new
  end
end
