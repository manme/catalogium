class Admin::CatalogsController < AdminController
  before_action :set_facade
  before_action :set_catalog, only: [:destroy, :update, :edit]

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
    if @facade.create catalog_params
      flash[:success] = t('admin.catalogs.created')
      redirect_to admin_catalogs_path
    else
      flash[:error] = t('admin.catalogs.error_create')
      render :new
    end
  end

  def update
    if @facade.update catalog_params
      flash[:success] = t('admin.catalogs.updated')
      redirect_to admin_catalogs_path
    else
      flash[:error] = t('admin.catalogs.error_update')
      render :edit
    end

  end

  def destroy
    if @facade.destroy
      flash[:success] = t('admin.catalogs.deleted')
      redirect_to admin_catalogs_path
    else
      flash[:error] = t('admin.catalogs.error_delete')
      redirect_to admin_catalogs_path
    end
  end

  private

  def set_facade
    @facade = Admin::CatalogFacade.new
  end

  def set_catalog
    @facade.find params[:id]
  end

  def catalog_params
    params.require(:catalog).permit(:title, :description, :slug)
  end
end
