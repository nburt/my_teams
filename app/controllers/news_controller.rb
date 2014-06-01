class NewsController < ApplicationController

  def index
    espn_api = EspnApi.new
    user = User.find(current_user.id)
    if user.have_team
      news_concatenator = NewsConcatenator.new(espn_api.baseball(user.baseball), espn_api.basketball(user.basketball), espn_api.football(user.football))
      @all_news = news_concatenator.merge
    end
  end

end