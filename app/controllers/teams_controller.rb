class TeamsController < ApplicationController

  def new
    @user = current_user
  end

  def create
    user = User.find(session[:user_id])
    user.update(:baseball => baseball_params)

    redirect_to root_path
  end

  private

  def baseball_params
    params.delete("utf8")
    params.delete("commit")
    params.delete("action")
    params.delete("controller")
    params.delete("authenticity_token")
    teams = ""
    params.each do |id, _|
      teams << "#{id}, "
    end
    teams.slice!(-2..-1)
    teams
  end

end