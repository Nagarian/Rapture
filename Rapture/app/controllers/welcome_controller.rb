class WelcomeController < ApplicationController
  def index
    @films = Tmdb::Movie.upcoming
  end
end


