class Admin::ProductsController < AdminController
  before_action :set_facade
  before_action :set_product, only: [:destroy, :update, :edit, :show]

  def index
    @facade.all
  end

  def new
  end

  def show
  end

  def create
    if @facade.create product_params
      flash[:success] = t('admin.products.created')
      redirect_to admin_catalog_products_path(@facade.catalog)
    else
      flash[:error] = t('admin.products.error_create')
      render :new
    end
  end

  def update
    if @facade.update product_params
      flash[:success] = t('admin.products.updated')
      redirect_to admin_catalog_products_path(@facade.catalog)
    else
      flash[:error] = t('admin.products.error_update')
      render :edit
    end
  end

  def destroy
    if @facade.destroy
      flash[:success] = t('admin.products.deleted')
      redirect_to admin_catalog_products_path(@facade.catalog)
    else
      flash[:error] = t('admin.products.error_delete')
      redirect_to admin_catalog_products_path(@facade.catalog)
    end
  end

  private

  def set_facade
    @facade = Admin::ProductFacade.new params[:catalog_id]
  end

  def set_product
    @facade.find params[:id]
  end

  def product_params
    params.require(:product).permit(:catalog_id,
        :title,
        :description,
        :sku,
        :state,
        :content,
        :category_id,
        :catalog_id)
  end
end
