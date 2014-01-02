class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include TheRole::Controller
  protect_from_forgery
   
  def access_denied
    render :text => 'access_denied: requires an role' and return
  end

  alias_method :login_required,     :authenticate_user! # you may change `authenticate_user` if have another Model, for example `Login` and then `authenticate_login`
  alias_method :role_access_denied, :access_denied
end
