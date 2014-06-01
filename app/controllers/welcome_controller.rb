class WelcomeController < ApplicationController

  def index
    espn_api = EspnApi.new
    news_concatenator = NewsConcatenator.new(espn_api.mariners, espn_api.clippers, espn_api.chargers)
    @all_news = news_concatenator.merge
  end

end