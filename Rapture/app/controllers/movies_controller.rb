class MoviesController < ApplicationController

  # GET /movies.json
  def home
    @movies = Tmdb::Movie.upcoming
    respond_to do |format|
      format.html { render "movies/home", layout: false }
      format.json { render json: @movies }
    end
  end

end
