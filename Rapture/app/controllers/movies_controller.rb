class MoviesController < ApplicationController

  def home
    respond_to do |format|
      format.html { render "movies/home", layout: false }
    end
  end

  def now_playing
    @movies = Tmdb::Movie.now_playing
    
    respond_movies
  end

  def upcoming
    @movies = Tmdb::Movie.upcoming

    respond_movies
  end

  def popular
    @movies = Tmdb::Movie.popular

    respond_movies
  end

  def top_rated
    @movies = Tmdb::Movie.top_rated
    
    respond_movies
  end

  def search
    search = Tmdb::Search.new
    search.resource('movie')
    search.query(params[:search])
    @movies = search.fetch
    params[:format] = "json"
    
    render "movies/home", format: 'json'
  end

  def user_movies
    respond_to do |format|
      format.html { render "movies/home", layout: false }
      format.json { render "movies/my_movies" }
    end
  end

  def detail
    respond_to do |format|
      format.html { render "movies/detail", layout: false }
      format.json { render json: Tmdb::Movie.detail(params[:id]) }
    end
  end

  private
    def respond_movies
      respond_to do |format|
        format.html { render "movies/home", layout: false }
        format.json { render "movies/home" }
      end
    end
end
