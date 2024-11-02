class Users::RegistrationsController < Devise::RegistrationsController
  # POST /users
  def create
    super do |resource|
      flash[:notice] = "Welcome! You have signed up successfully." if is_navigational_format?
    end
  end
end
