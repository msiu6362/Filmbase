# -*- encoding : utf-8 -*-
class GenresController < ApplicationController
  before_filter :check_auth,:admin_permission,:except=>'show'

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @films=@genre.films.page(params[:page])
  end

  def new
    @genre = Genre.new
  end


  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(params[:genre])
    if @genre.save
      redirect_to @genre, notice: 'Жанр создан.'
    else
      render action: "new"
    end
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update_attributes(params[:genre])
      redirect_to @genre, notice: 'Жанр сохранен.'
    else
      render action: "edit"
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to genres_url, notice: "Жанр удален"
  end
end
