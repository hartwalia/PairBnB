class UsersController < Clearance::UsersController
  
  def edit
  end
  
  def create
    @user = User.new(user_params_revised)

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def user_params_revised
    params.require(:user).permit(:name, :email, :password)
  end

end