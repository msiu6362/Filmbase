# -*- encoding : utf-8 -*-
class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :name
      t.string :origin_name
      t.text :slogan
      t.references :country
      t.references :genre
      t.references :director
      t.integer :length
      t.integer :year
      t.text :description
      t.string :trailer_url
      t.has_attached_file :cover

      t.timestamps
    end
    add_index :films, :country_id
    add_index :films, :genre_id
    add_index :films, :director_id
  end
end
