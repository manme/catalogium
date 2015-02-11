class Admin::SessionsController < AdminController
  skip_before_action :authenticate_admin

  def new
  end

  def create
    admin = Account.find_by(email: params[:sessions][:email])
    if admin && admin.authenticate(params[:sessions][:password])
      sign_in_admin(admin)
      flash[:success] = t('admin.sessions.signed_in')
      redirect_to admin_root_path
    else
      flash[:danger] = t('admin.failure.invalid')
      render :new
    end
  end

  def destroy
    sign_out_admin
    flash[:success] = t('admin.sessions.signed_out')
    redirect_to admin_root_path
  end
end
