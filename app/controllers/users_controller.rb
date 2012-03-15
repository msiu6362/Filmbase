# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    @user = User.new(params[:user])
    @user.role=0
    if @user.save
      redirect_to root_url, :notice => "Регистрация завершена!"
    else
      render :new
    end
  end
end
