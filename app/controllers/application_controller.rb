class ApplicationController < ActionController::Base
#protect_from_forgery
  def is_admin
    if session[:admin] != "admin"
      redirect_to :controller => 'admin', :action => 'login'
    end
  end
end
