# -*- encoding : utf-8 -*-
class Country < ActiveRecord::Base
  has_many :films,:order=>'films.name'

  validates :name, presence: true, uniqueness: true

  default_scope order('countries.name')

end
