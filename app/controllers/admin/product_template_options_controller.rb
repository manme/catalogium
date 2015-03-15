class Admin::ProductTemplatesController < AdminController
  before_action :set_facade
  before_action :set_product_template_option, only: [:destroy, :update, :edit]

  def index
    @facade.all
  end

  def edit
  end

  def create
    if @facade.create product_template_option_params
      flash[:success] = t('admin.product_template_options.created')
      redirect_to admin_product_template_options_path
    else
      flash[:error] = t('admin.product_template_options.error_create')
      render :new
    end
  end

  def update
    if @facade.update product_template_option_params
      flash[:success] = t('admin.product_template_options.updated')
      redirect_to admin_product_template_options_path
    else
      flash[:error] = t('admin.product_template_options.error_update')
      render :edit
    end
  end

  def destroy
    if @facade.destroy
      flash[:success] = t('admin.product_template_options.deleted')
    else
      flash[:error] = t('admin.product_template_options.error_delete')
    end
    redirect_to admin_product_template_options_path
  end

  private

  def set_facade
    @facade = Admin::ProductTemplateFacade.params[:product_template_id]
  end

  def set_product_template_option
    @facade.find params[:id]
  end

  def product_template_option_params
    params.require(:product).permit(:name, :type, :default)
  end
end
