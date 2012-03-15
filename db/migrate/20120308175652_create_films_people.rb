# -*- encoding : utf-8 -*-
class CreateFilmsPeople < ActiveRecord::Migration
  def change
    create_table :films_people,:id=>false do |t|
      t.references :film
      t.references :person
    end
    add_index :films_people,:film_id
    add_index :films_people,:person_id
  end
end
