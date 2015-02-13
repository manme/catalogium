class Admin::MenusController < AdminController
  before_action :set_facade

  def index
    @facade.all
  end

  def set_facade
    @facade = Admin::TopMenuFacade.new
  end
end
