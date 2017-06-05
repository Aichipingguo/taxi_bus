class  UsersController < LoggedController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    #@user.uuid = session[:user_uuid]
    if @user.save
      flash[:notice] = "注册成功，请登录"
      redirect_to new_session_path
    else
      render action: :new
    end
  end


  private

    def  user_param
      params.require(:user).permit(:email,:password,:password_confirmation,:loginname)
    end

end
