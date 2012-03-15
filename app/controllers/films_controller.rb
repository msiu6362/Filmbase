# -*- encoding : utf-8 -*-
class FilmsController < ApplicationController
  before_filter :check_auth,:admin_permission,:except=>['show','index']

  def index
    @films = Film.page(params[:page])
  end

  # GET /films/1
  # GET /films/1.json
  def show
    @film = Film.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @film }
    end
  end


  def new
    @film = Film.new
  end

  # GET /films/1/edit
  def edit
    @film = Film.find(params[:id])
  end

  # POST /films
  # POST /films.json
  def create
    @film = Film.new(params[:film])

    respond_to do |format|
      if @film.save
        format.html { redirect_to @film, notice: 'Film was successfully created.' }
        format.json { render json: @film, status: :created, location: @film }
      else
        format.html { render action: "new" }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /films/1
  # PUT /films/1.json
  def update
    @film = Film.find(params[:id])

    respond_to do |format|
      if @film.update_attributes(params[:film])
        format.html { redirect_to @film, notice: 'Film was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    @film = Film.find(params[:id])
    @film.destroy

    respond_to do |format|
      format.html { redirect_to films_url }
      format.json { head :no_content }
    end
  end
end
