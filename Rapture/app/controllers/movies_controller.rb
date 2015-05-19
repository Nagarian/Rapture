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

    movie = Array.new
    movie.add(Tmdb::Find.imdb_id(current_user.user_movies.last.id))


    respond_to do |format|
      format.html { render "movies/home", layout: false }
      format.json { render json: movie }
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
