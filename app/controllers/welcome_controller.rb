class WelcomeController < ApplicationController

  def index
    if current_user
      redirect_to news_index_path
    else
      @user = User.new
    end
  end

end