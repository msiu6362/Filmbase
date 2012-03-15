# -*- encoding : utf-8 -*-
class Genre < ActiveRecord::Base
  has_many :films,:order=>'genres.name'

  validates :name, presence: true, uniqueness: true

  default_scope order('name')
end
