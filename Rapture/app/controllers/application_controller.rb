class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  require 'themoviedb'

  before_filter :set_config
  Tmdb::Api.key("78bf89f89e8823557d092c0602767586")
  # before_action :authenticate_user!

  def set_config
  	@configuration = Tmdb::Configuration.new
  end
end


