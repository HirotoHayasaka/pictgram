class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def  index
    @topics = Topic.all.includes(:favorite_users)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end

def commenter
  gon.c = comment_counter;
end
