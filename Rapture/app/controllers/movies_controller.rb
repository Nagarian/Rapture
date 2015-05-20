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

  def userMovies
    movies = Array.new

    current_user.user_movies.each do |movie|
      movies.push(Tmdb::Movie.detail(movie.movie_id))
    end

    respond_to do |format|
      format.html { render "movies/home", layout: false }
      format.json { render json: movies }
    end
  end
end
