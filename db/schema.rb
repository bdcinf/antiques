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

ActiveRecord::Schema.define(:version => 20151201040547) do

  create_table "emails", :force => true do |t|
    t.string   "name"
    t.string   "mail"
    t.string   "phone"
    t.string   "image_file_file_name"
    t.string   "image_file_content_type"
    t.integer  "image_file_file_size"
    t.datetime "image_file_updated_at"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "product_categories", :force => true do |t|
    t.string   "name"
    t.string   "img_file_file_name"
    t.string   "img_file_content_type"
    t.integer  "img_file_file_size"
    t.datetime "img_file_updated_at"
    t.text     "description"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "status"
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
    t.string   "status"
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
    t.string   "status"
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

  create_table "sliders", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
