# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  authenticates_with_sorcery!

  ROLES=["Пользователь", "Администратор"]

  validates :email, presence: true, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :name,presence: true, length: {maximum: 100}
  validates :role,presence: true,inclusion: {in: 0...ROLES.size}
  validates :password, confirmation: true, length: {minimum: 6}, on: :create

  attr_accessible :name,:email,:password,:password_confirmation


  def admin?
    role==1
  end

end
