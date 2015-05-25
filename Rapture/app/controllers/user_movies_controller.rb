class UserMoviesController < ApplicationController
  before_action :set_user_movie, only: [:show, :edit, :update, :destroy]

  def synchro
    params = user_movie_paramsPermitted
    user_in_movie = current_user.user_movies.where(movie_id: params[:movie_id]).first
    if user_in_movie != nil
      if !params[:isFav]
        user_in_movie.destroy
        head :no_content
      else
        if user_in_movie.update(is_seen: params[:isSeen])
          head :ok
        else
          render json: user_in_movie.errors, status: :unprocessable_entity
        end
      end
    elsif params[:isFav]
      user_movie = UserMovie.new(movie_id: params[:movie_id], is_seen: params[:isSeen])
      current_user.user_movies.push(user_movie)
      if current_user.save
        head :created
      else
        render json: current_user.errors, status: :unprocessable_entity
      end          
    end
  end

  # GET /user_movies
  # GET /user_movies.json
  def index
    @user_movies = UserMovie.all
  end

  # GET /user_movies/1
  # GET /user_movies/1.json
  def show
  end

  # GET /user_movies/new
  def new
    @user_movie = UserMovie.new
  end

  # GET /user_movies/1/edit
  def edit
  end

  # POST /user_movies
  # POST /user_movies.json
  def create
    @user_movie = UserMovie.new(user_movie_params)

    current_user.user_movies.push(@user_movie)
    current_user.save

    respond_to do |format|
      if @user_movie.save
        format.html { redirect_to @user_movie, notice: 'User movie was successfully created.' }
        format.json { render :show, status: :created, location: @user_movie }
      else
        format.html { render :new }
        format.json { render json: @user_movie.errors, status: :unprocessable_entity }
      end
    end


  end

  # PATCH/PUT /user_movies/1
  # PATCH/PUT /user_movies/1.json
  def update
    respond_to do |format|
      if @user_movie.update(user_movie_params)
        format.html { redirect_to @user_movie, notice: 'User movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_movie }
      else
        format.html { render :edit }
        format.json { render json: @user_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_movies/1
  # DELETE /user_movies/1.json
  def destroy
    @user_movie.destroy
    respond_to do |format|
      format.html { redirect_to user_movies_url, notice: 'User movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_movie
      @user_movie = UserMovie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_movie_params
      params.require(:user_movie).permit(:movie_id, :is_seen)
    end

    def user_movie_paramsPermitted
      params.permit(:movie_id, :_json)
      json = JSON.parse params[:_json]
      return paramsPretty = {
        movie_id: params[:movie_id].to_i,
        isSeen: json["isSeen"],
        isFav: json["isFav"]
      }
    end
end
