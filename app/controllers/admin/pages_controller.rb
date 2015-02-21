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
      flash[:success] = t('admin.pages.created')
      redirect_to admin_pages_path
    else
      flash[:error] = t('admin.pages.error_create')
      render :new
    end
  end

  def update
    if @facade.update page_params
      flash[:success] = t('admin.pages.updated')
      redirect_to admin_pages_path
    else
      flash[:error] = t('admin.pages.error_update')
      render :edit
    end
  end

  def destroy
    if @facade.destroy
      flash[:success] = t('admin.pages.deleted')
      redirect_to admin_pages_path
    else
      flash[:error] = t('admin.pages.error_delete')
      redirect_to admin_pages_path
    end
  end

  private

  def set_facade
    @facade = Admin::PageFacade.new
  end

  def set_page
    @facade.find params[:id]
  end

  def page_params
    params.require(:page).permit(:title, :content, :slug, :bootsy_image_gallery_id)
  end
end
