class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :set_admin_menu_item
  
  #make admin menu item the active one
  def set_admin_menu_item
    @current_menu_item = "admin"
  end
end
