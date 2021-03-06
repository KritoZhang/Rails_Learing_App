# coding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  # 确保用户已登录
  def logged_in_user
    unless logged_in?
      store_location #存储登录前想要访问的URL
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
