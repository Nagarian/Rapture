class MoviesController < ApplicationController

  def home
    @movies = Tmdb::Movie.popular
    respond_to do |format|
      format.html { render "movies/home", layout: false }
    end
  end

  # GET /movies.json
  def popular
    @movies = Tmdb::Movie.popular

    respond_to do |format|
      format.html { render "movies/home", layout: false }
      format.json { render "movies/home" }
    end
  end

  def upcoming
    @movies = Tmdb::Movie.upcoming
    respond_to do |format|
      format.html { render "movies/home", layout: false }
      format.json { render json: @movies }
    end
  end

  def user_movies
    respond_to do |format|
      format.html { render "movies/home", layout: false }
      format.json { render "movies/my_movies" }
    end
  end
end
