# -*- encoding : utf-8 -*-
class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :origin_name
      t.boolean :male
      t.date :birthday
      t.has_attached_file :avatar
      t.timestamps
    end
  end
end
