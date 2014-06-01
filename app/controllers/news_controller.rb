class NewsController < ApplicationController

  def index
    espn_api = EspnApi.new
    user = User.find(current_user.id)
    if user.baseball != nil
      news_concatenator = NewsConcatenator.new(espn_api.baseball(user.baseball))
      @all_news = news_concatenator.merge
    else
      @all_news = []
    end
  end

end