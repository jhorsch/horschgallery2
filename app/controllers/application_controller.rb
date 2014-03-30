class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    @myarray = ['Chicago Black & White','Chicago Vintage','Chicago Panoramas','Chicago Cityscape','Chicago Landmarks']


end
