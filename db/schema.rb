# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120308175652) do

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "films", :force => true do |t|
    t.string   "name"
    t.string   "origin_name"
    t.text     "slogan"
    t.integer  "country_id"
    t.integer  "genre_id"
    t.integer  "director_id"
    t.integer  "length"
    t.integer  "year"
    t.text     "description"
    t.string   "trailer_url"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "films", ["country_id"], :name => "index_films_on_country_id"
  add_index "films", ["director_id"], :name => "index_films_on_director_id"
  add_index "films", ["genre_id"], :name => "index_films_on_genre_id"

  create_table "films_people", :id => false, :force => true do |t|
    t.integer "film_id"
    t.integer "person_id"
  end

  add_index "films_people", ["film_id"], :name => "index_films_people_on_film_id"
  add_index "films_people", ["person_id"], :name => "index_films_people_on_person_id"

  create_table "genres", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "origin_name"
    t.boolean  "male"
    t.date     "birthday"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                        :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.integer  "role"
    t.string   "name"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end
