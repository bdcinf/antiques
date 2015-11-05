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

ActiveRecord::Schema.define(:version => 20150911005502) do

  create_table "product_categories", :force => true do |t|
    t.string   "name"
    t.string   "img_file_file_name"
    t.string   "img_file_content_type"
    t.integer  "img_file_file_size"
    t.datetime "img_file_updated_at"
    t.text     "description"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "product_images", :force => true do |t|
    t.integer  "product_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "product_subcategories", :force => true do |t|
    t.integer  "product_category_id"
    t.string   "name"
    t.string   "img_file_file_name"
    t.string   "img_file_content_type"
    t.integer  "img_file_file_size"
    t.datetime "img_file_updated_at"
    t.text     "description"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "product_subsubcategories", :force => true do |t|
    t.integer  "product_category_id"
    t.integer  "product_subcategory_id"
    t.string   "name"
    t.string   "img_file_file_name"
    t.string   "img_file_content_type"
    t.integer  "img_file_file_size"
    t.datetime "img_file_updated_at"
    t.text     "description"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "product_category_id"
    t.integer  "product_subcategory_id"
    t.integer  "product_subsubcategory_id"
    t.string   "product_var_id"
    t.string   "name"
    t.decimal  "price",                     :precision => 15, :scale => 2
    t.text     "description"
    t.string   "img_file_file_name"
    t.string   "img_file_content_type"
    t.integer  "img_file_file_size"
    t.datetime "img_file_updated_at"
    t.string   "status"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
  end

end
