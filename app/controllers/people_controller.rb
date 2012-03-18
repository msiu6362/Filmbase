# -*- encoding : utf-8 -*-
class PeopleController < ApplicationController
  before_filter :check_auth, :admin_permission, :except => ['show', 'index']

  def index
    respond_to do |format|
      format.html do
        @people = Person.page(params[:page])
      end
      format.json do
        q="%#{params[:q]}%"
        render json: Person.where("lower(name) like ? or lower(origin_name) like ?", q, q).all.to_json(only: [:name, :id])
      end
    end

  end

  def show
    @person = Person.full_load.find(params[:id])
  end


  def new
    @person = Person.new(male: true)
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(params[:person])

    if @person.save
      redirect_to @person, notice: 'Персона создана.'
    else
      render action: "new"
    end
  end

  def update
    @person = Person.find(params[:id])

    if @person.update_attributes(params[:person])
      redirect_to @person, notice: 'Персона сохранена.'
    else
      render action: "edit"
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to people_url, notice: "Персона удалена"
  end
end
