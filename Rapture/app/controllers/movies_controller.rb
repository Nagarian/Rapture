class MoviesController < ApplicationController

  # GET /movies.json
  def index
    @movies = Tmdb::Movie.upcoming
    render json: @movies
  end

end
