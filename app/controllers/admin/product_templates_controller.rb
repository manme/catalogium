class Admin::ProductTemplatesController < AdminController
  before_action :set_facade
  before_action :set_product_template, only: [:destroy, :update, :edit, :show]

  def index
    @facade.all
  end

  def new
  end

  def show

  end

  def edit

  end

  def create
    if @facade.create product_template_params
      flash[:success] = t('admin.product_templates.created')
      redirect_to admin_product_templates_path
    else
      flash[:error] = t('admin.product_templates.error_create')
      render :new
    end
  end

  def update
    if @facade.update product_template_params
      flash[:success] = t('admin.product_templates.updated')
      redirect_to admin_product_templates_path
    else
      flash[:error] = t('admin.product_templates.error_update')
      render :edit
    end
  end

  def destroy
    if @facade.destroy
      flash[:success] = t('admin.product_templates.deleted')
    else
      flash[:error] = t('admin.product_templates.error_delete')
    end
    redirect_to admin_product_templates_path
  end

  private

  def set_facade
    @facade = Admin::ProductTemplateFacade.new
  end

  def set_product_template
    @facade.find params[:id]
  end

  def product_template_params
    params.require(:product).permit(:name)
  end
end
