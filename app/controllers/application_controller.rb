# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_auth
    unless logged_in?
      flash[:error]="Доступ запрещен"
      redirect_to new_session_path
    end
  end

  def admin_permission
    unless current_user.admin?
      flash[:error]="Доступ запрещен"
      redirect_to root_path
    end
  end
end
