class Admin::CategoriesController < AdminController
  before_action :set_facade
  before_action :set_category, only: [:destroy, :update, :edit]

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
    if @facade.create category_params
      flash[:success] = t('admin.categories.created')
      redirect_to admin_categories_path
    else
      flash[:error] = t('admin.categories.error_create')
      render :new
    end
  end

  def update
    if @facade.update category_params
      flash[:success] = t('admin.categories.updated')
      redirect_to admin_categories_path
    else
      flash[:error] = t('admin.categories.error_update')
      render :edit
    end

  end

  def destroy
    if @facade.destroy
      flash[:success] = t('admin.categories.deleted')
      redirect_to admin_categories_path
    else
      flash[:error] = t('admin.categories.error_delete')
      redirect_to admin_categories_path
    end
  end

  private

  def set_facade
    @facade = Admin::CategoryFacade.new
  end

  def set_category
    @facade.find params[:id]
  end

  def category_params
    params.require(:category).permit(:title, :description, :parent_id)
  end
end

