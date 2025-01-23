# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 20_241_217_210_107) do
  create_table 'beers', charset: 'utf8mb3', force: :cascade do |t|
    t.string 'name'
    t.string 'style'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'beers_pubs', charset: 'utf8mb3', force: :cascade do |t|
    t.bigint 'beer_id', null: false
    t.bigint 'pub_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['beer_id'], name: 'index_beers_pubs_on_beer_id'
    t.index ['pub_id'], name: 'index_beers_pubs_on_pub_id'
  end

  create_table 'food_pairings', charset: 'utf8mb3', force: :cascade do |t|
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'pubs', charset: 'utf8mb3', force: :cascade do |t|
    t.string 'name'
    t.string 'location'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'beers_pubs', 'beers'
  add_foreign_key 'beers_pubs', 'pubs'
end
