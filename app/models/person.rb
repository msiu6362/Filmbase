# -*- encoding : utf-8 -*-
class Person < ActiveRecord::Base
  has_attached_file :avatar,styles: {medium: '220x', thumb: '60x' }

  has_and_belongs_to_many :films

  validates_attachment_content_type :avatar, content_type: /^image\/(gif|png|x\-png|jpeg|jpg|jpeg)$/

  validates :name, presence: true, length: {minimum: 3}

  def sex
    male? ? "Мужской" : "Женский"
  end

  def age
    return 0 if birthday.blank?
    now = Date.today
    year = now.year - birthday.year
    year -=  1 if (birthday+year.year) > now
    year
  end

end
