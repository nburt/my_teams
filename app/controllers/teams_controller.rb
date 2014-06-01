class TeamsController < ApplicationController

  def new
    @user = current_user
  end

  def create
    @user = User.find(session[:user_id])
    @user.update(:baseball => baseball_params(params), :basketball => basketball_params(params),:football => football_params(params), :have_team => true)
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

  def football_params(params)
    params.delete("utf8")
    params.delete("commit")
    params.delete("action")
    params.delete("controller")
    params.delete("authenticity_token")
    teams = ""
    if params["football"]
      params["football"].each do |id, _|
        teams << "#{id}, "
      end
      teams.slice!(-2..-1)
      teams
    else
      @user.football
    end
  end

end