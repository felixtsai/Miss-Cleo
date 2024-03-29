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

ActiveRecord::Schema.define(:version => 20121008202457) do

  create_table "guesses", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.float    "height"
    t.integer  "weight"
    t.string   "sex"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.float    "height"
    t.integer  "weight"
    t.string   "sex"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "population_states", :force => true do |t|
    t.integer  "total_females",                      :default => 0
    t.integer  "total_males",                        :default => 0
    t.float    "total_female_height", :limit => 255, :default => 0.0
    t.float    "total_male_height",                  :default => 0.0
    t.integer  "total_female_weight",                :default => 0
    t.integer  "total_male_weight",                  :default => 0
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

end
