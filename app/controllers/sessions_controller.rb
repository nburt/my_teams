class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(:email => params[:user][:email])
    if user.present? && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      session[:user_id] = nil
      @user = User.new
      redirect_to '/login', flash: {:login_failure => "Invalid email or password"}
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end