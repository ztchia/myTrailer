class Users::RegistrationsController < Devise::RegistrationsController
before_filter :sign_up_params, only: [:create]
before_filter :account_update_params, only: [:update]

def create
  super
   if params[:profile_pic].present?
    preloaded = Cloudinary::PreloadedFile.new(params[:image_id])         
    raise "Invalid upload signature" if !preloaded.valid?
    @user.profile_pic = preloaded.identifier
  end 

    if @user.provider.present? 
      redirect_to "edit_user_registration_path"
    end
end
  private

  def sign_up_params
    params.require(:user).permit(:username, :profile_pic, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username,:profile_pic, :email, :password, :password_confirmation, :current_password)
  end
end
