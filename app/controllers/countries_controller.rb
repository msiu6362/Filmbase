# -*- encoding : utf-8 -*-
class CountriesController < ApplicationController
  before_filter :check_auth, :admin_permission,:except=>'show'

  def index
    @countries = Country.page(params[:page])
  end

  def show
    @country = Country.find(params[:id])
    @films=@country.films.page(params[:page])
  end

  def new
    @country = Country.new
  end


  def edit
    @country = Country.find(params[:id])
  end

  def create
    @country = Country.new(params[:country])
    if @country.save
      redirect_to @country, notice: 'Страна создана.'
    else
      render action: "new"

    end
  end

  def update
    @country = Country.find(params[:id])

    if @country.update_attributes(params[:country])
      redirect_to @country, notice: 'Страна сохранена.'
    else
      render action: "edit"
    end
  end


  def destroy
    @country = Country.find(params[:id])
    @country.destroy
    redirect_to countries_url, notice: "Страна удалена"
  end
end
