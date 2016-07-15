class Acme::RegistrationsController < Devise::RegistrationsController

  
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]



  # GET /resource/sign_up
   def new
        set_meta_tags title: 'Sign Up', 
            description: "Mrentz Sign up page."
     super
   end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
   def edit
        set_meta_tags title: 'My Account', 
            description: "Mrentz My Accounts Edit page."
     super
   end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:fullname, :email, :password, :password_confirmation, :mobile_number, :is_verified)
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:fullname, :email, :password, :password_confirmation, :mobile_number, :current_password, :is_verified)
    end
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_sign_up_path_for(resource)
      verifications_path
  end 

=begin
  def after_update_path_for(resource)
    if current_user.is_verified?
      root_path
    else
      verifications_path
    end
  end
=end




  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

end
