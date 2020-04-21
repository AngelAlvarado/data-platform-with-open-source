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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_19_092328) do

  create_table "counties", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.decimal "latitude", precision: 13, scale: 7
    t.decimal "longitude", precision: 13, scale: 7
    t.string "state"
    t.string "name"
    t.integer "fips"
    t.integer "ansicode"
    t.integer "awater"
    t.integer "aland"
    t.decimal "aland_sqmi", precision: 10
    t.decimal "awater_sqmi", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "covidcases", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.date "date"
    t.decimal "latitude", precision: 13, scale: 7
    t.decimal "longitude", precision: 13, scale: 7
    t.string "county"
    t.string "state"
    t.integer "fips"
    t.integer "cases"
    t.integer "deaths"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
