class TeamsController < ApplicationController

  def new
    @user = current_user
  end

  def create
    @user = User.find(session[:user_id])
    params_instance = params
    @user.update(:baseball => baseball_params(params_instance), :basketball => basketball_params(params), :have_team => true)
    redirect_to root_path
  end

  private

  def baseball_params(params)
    params.delete("utf8")
    params.delete("commit")
    params.delete("action")
    params.delete("controller")
    params.delete("authenticity_token")
    teams = ""
    if params["baseball"]
      params["baseball"].each do |id, _|
        teams << "#{id}, "
      end
      teams.slice!(-2..-1)
      teams
    else
      @user.baseball
    end

  end

  def basketball_params(params)
    params.delete("utf8")
    params.delete("commit")
    params.delete("action")
    params.delete("controller")
    params.delete("authenticity_token")
    teams = ""
    if params["basketball"]
      params["basketball"].each do |id, _|
        teams << "#{id}, "
      end
      teams.slice!(-2..-1)
      teams
    else
      @user.basketball
    end
  end

end