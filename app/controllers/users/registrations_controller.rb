class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  # POST /users
  def create
    super do |resource|
      # attach profile picture if it's present
      resource.profile_picture.attach(params[:user][:profile_picture]) if params[:user][:profile_picture].present?

      flash[:notice] = "Welcome! You have signed up successfully." if is_navigational_format?
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :age, :profile_picture ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :first_name, :last_name, :age, :profile_picture ])
  end
end
