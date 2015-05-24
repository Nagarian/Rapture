class ApplicationController < ActionController::Base
  require 'themoviedb'

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :set_config
  layout :layout

  private
    Tmdb::Api.key("78bf89f89e8823557d092c0602767586")
    Tmdb::Api.language("fr")
    # before_action :authenticate_user!
    def set_config
    	@configuration = Tmdb::Configuration.new
    end

    def layout
      !devise_controller? && "application"
    end
end


