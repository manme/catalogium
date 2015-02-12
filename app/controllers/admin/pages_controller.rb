class Admin::PagesController < AdminController
  before_action :set_facade
  before_action :set_page, only: [:destroy, :update, :edit]

  def index
    @facade.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @facade.create page_params
      flash[:success] = "Страница добавлена"
      redirect_to admin_pages_path
    else
      @facade.all
      render :index
    end
  end

  def update
    if @facade.update page_params
      flash[:success] = "Страница обновлена"
      redirect_to admin_pages_path
    else
      render :edit
    end

  end

  def destroy
    if @facade.destroy
      flash[:success] = "Страница удалена"
      redirect_to admin_pages_path
    else
      flash[:danger] = "Ошибка при удалении страницы"
      redirect_to admin_pages_path
    end
  end

  private

  def set_facade
    @facade = PageFacade.new
  end

  def set_page
    @facade.find params[:id]
  end

  def page_params
    params.require(:page).permit(:title, :content, :position, :slug)
  end
end
