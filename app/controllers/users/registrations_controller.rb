class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash=nil)
    hash[:uid] = SecureRandom.uuid
    super
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(registration_params)
    if @user.valid?
      @user.save
      render 'finish'
    else
      super
    end
  end

  def confirm
    @address = confirm_params
  end

  private

  def registration_params
    params
      .require(:user)
      .permit(:username, :email, :password, :password_confirmation)
  end

  def confirm_params
    params.permit(:address)
  end
end
