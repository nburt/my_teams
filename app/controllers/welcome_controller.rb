class WelcomeController < ApplicationController

  def index
    espn_api = EspnApi.new
    @all_news = NewsConcatenator.new(espn_api.mariners, espn_api.clippers).merge
  end

end