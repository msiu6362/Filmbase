# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :notice => "Авторизация выполнена!"
    else
      flash[:error]="Неверное имя пользователя или пароль"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, :notice => "Выход выполнен!"
  end


end
