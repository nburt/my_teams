class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :has_baseball_team?
  helper_method :has_football_team?
  helper_method :has_basketball_team?

  private

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def has_baseball_team?(id)
    current_user.baseball == id
  end

  def has_football_team?(id)
    current_user.football == id
  end

  def has_basketball_team?(id)
    current_user.basketball == id
  end
end
