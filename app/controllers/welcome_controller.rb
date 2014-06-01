class WelcomeController < ApplicationController

  def index
    espn_api = EspnApi.new
    @mariners_news = espn_api.mariners
  end

end