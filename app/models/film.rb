# -*- encoding : utf-8 -*-
class Film < ActiveRecord::Base
  belongs_to :country
  belongs_to :genre
  belongs_to :director, :class_name => 'Person'
  has_and_belongs_to_many :people, :order => 'people.name'


  has_attached_file :cover, styles: {medium:'220x', thumb: '60x'}

  validates_attachment_content_type :cover, content_type: /^image\/(gif|png|x\-png|jpeg|jpg )$/

  validates :name, presence: true
  validates :country_id, presence: true
  validates :genre_id, presence: true
  validates :length, numericality: {only_integer: true, greater_than: 0}, allow_blank: true
  validates :year, numericality: {only_integer: true, greater_than: 1850}, allow_blank: true

  validates :trailer_url, format: /\w+/i, allow_blank: true

  attr_reader :person_tokens

  scope :full_load, includes(:genre, :country, :director, :people)

  def person_tokens=(ids)
    self.person_ids=ids.split(',')
  end

  def newest?
    created_at > 1.year.ago
  end

  def this_year?
    Time.now.year==year
  end


end
