class UsersController < ApplicationController


  def login
    @user = User.find_by('email': login_params[:email])
    puts  @user
    if !!@user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:danger] = "Email or password is incorrect"
      redirect_to :login
    end
  end
  def register
    @user = User.new(register_params)
    if User.find_by(email: @user.email)
      flash[:danger] = "Email is already in use"
      redirect_to :register
    else
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        render :register
      end
    end
  end
  def register_form
    render :register
  end
  def login_form
    render :login
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
  private

  def register_params
    params.permit(:name,:email, :password, :password_confirmation)
  end
  def login_params
    params.permit(:email, :password)
  end
end
