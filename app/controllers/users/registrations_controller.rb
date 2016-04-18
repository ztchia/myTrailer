class Users::RegistrationsController < Devise::RegistrationsController
before_filter :sign_up_params, only: [:create]
before_filter :account_update_params, only: [:update]
  # def create
  #   @user = User.new(sign_up_params)
  #   byebug
  #   if @user.profile_pic.present?
  #     Cloudinary::Uploader.upload(params[:profile_pic])
  #   end
  # end

  # def update
  #    if @user.update(account_update_params)
  #     byebug
  #      if @user.profile_pic.present?
  #         Cloudinary::Uploader.upload(params[:profile_pic])
  #      end
  #    end
  # end
  private

  def sign_up_params
    params.require(:user).permit(:username, :profile_pic, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username,:profile_pic, :email, :password, :password_confirmation, :current_password)
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
