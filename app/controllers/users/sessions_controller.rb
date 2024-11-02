class Users::SessionsController < Devise::SessionsController
  # POST /users/sign_in
  def create
    super do |resource|
      flash[:notice] = "Successfully logged in!" if is_navigational_format?
    end
  end

  # DELETE /users/sign_out
  def destroy
    flash[:notice] = "Successfully logged out!" if is_navigational_format?
    super
  end
end
