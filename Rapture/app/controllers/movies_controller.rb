class MoviesController < ApplicationController

  # GET /movies.json
  def popular
    @movies = Tmdb::Movie.popular
    respond_to do |format|
      format.html { render "movies/home", layout: false }
      format.json { render json: @movies }
    end
  end

  def upcoming
    @movies = Tmdb::Movie.upcoming
    respond_to do |format|
      format.html { render "movies/home", layout: false }
      format.json { render json: @movies }
    end
  end
end
