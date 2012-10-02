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

ActiveRecord::Schema.define(:version => 20121001084654) do

  create_table "organizations", :force => true do |t|
    t.integer  "user_id"
    t.string   "type_of_ownership"
    t.string   "company_name"
    t.string   "unp"
    t.string   "juridical_address"
    t.string   "mailing_address"
    t.string   "contact_name"
    t.string   "phone_number_0"
    t.string   "phone_number_1"
    t.string   "phone_number_2"
    t.string   "phone_number_3"
    t.string   "phone_number_4"
    t.string   "phone_number_5"
    t.string   "phone_number_6"
    t.string   "phone_number_7"
    t.string   "phone_number_8"
    t.string   "phone_number_9"
    t.string   "email"
    t.string   "work_time"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "product_colors", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "product_type_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "product_colors", ["product_type_id"], :name => "index_product_colors_on_product_type_id"

  create_table "product_sizes", :force => true do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "count"
    t.integer  "reserv"
    t.integer  "product_color_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "number"
  end

  add_index "product_sizes", ["product_color_id"], :name => "index_product_sizes_on_product_color_id"

  create_table "product_types", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "product_types", ["product_id"], :name => "index_product_types_on_product_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_groups", :force => true do |t|
    t.string   "name"
    t.integer  "least_order",      :default => 5
    t.boolean  "admin_flag",       :default => false
    t.boolean  "view_reserv_flag", :default => false
    t.boolean  "view_sklad_flag",  :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "total_amount",      :default => 0
    t.boolean  "edit_data_flag",    :default => true
    t.boolean  "reg_confirm_admin", :default => false
    t.integer  "user_group_id",     :default => 1
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

end