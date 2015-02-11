class AdminController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_admin

  helper_method :admin_signed_in?
  private

  def current_admin
    @current_admin ||= Account.find_by(id: session[:admin_id]) if session[:admin_id]
  end

  def admin_signed_in?
    return true if current_admin
  end

  def authenticate_admin
    redirect_to new_admin_session_path unless admin_signed_in?
  end

  def sign_in_admin(admin)
    session[:admin_id] = admin.id if admin
  end

  def sign_out_admin
    session[:admin_id] = nil
  end
end
