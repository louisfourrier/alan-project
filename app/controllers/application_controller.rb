class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, :if => :devise_controller?





  def after_sign_in_path_for(resource)
    case resource
    when :user, User
      user_path(current_user)
    #when :employee, Employee
      #owner_path(current_owner)
    #when :admin_user, AdminUser
      #administration_dashboard_path
    else
      super
    end
  end

  # Set the @user varibale to current_user. Useless here but for future customization it is important
  def set_current_user
    if current_user
      @user = current_user
    else
      redirect_to root_path, notice: "Vous devez être connecté pour accèder à cette page"
      return
    end
  end



  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :company_name, :company_domain, :email, :password, :password_confirmation) }
 end


  private




  # Filter of user authentification and user assignement
  def authenticate_user
    if !user_signed_in?
      redirect_to new_user_session_path(), notice: "Connectez-vous afin d'accèder à votre espace de gestion"
      return
    end
  end





end
