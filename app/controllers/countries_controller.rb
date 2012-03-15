# -*- encoding : utf-8 -*-
class CountriesController < ApplicationController
  before_filter :check_auth, :admin_permission

  def index
    @countries = Country.all
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
    @country = Country.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @country }
    end
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
