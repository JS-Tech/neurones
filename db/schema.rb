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

ActiveRecord::Schema.define(:version => 20130910164700) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "subtitle"
    t.integer  "likes",       :default => 0
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "image"
  end

  create_table "cantons", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "thumbup",    :default => 0
    t.integer  "thumbdown",  :default => 0
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "comment_id"
  end

  add_index "comments", ["article_id"], :name => "index_comments_on_article_id"
  add_index "comments", ["comment_id"], :name => "index_comments_on_comment_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "elements", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.datetime "date"
    t.integer  "image_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "content"
    t.string   "title"
  end

  add_index "events", ["image_id"], :name => "index_events_on_image_id"

  create_table "events_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "g_comp_groups", :force => true do |t|
    t.integer  "group_id"
    t.integer  "module_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "g_comp_groups", ["group_id"], :name => "index_group_comp_groups_on_group_id"
  add_index "g_comp_groups", ["module_id"], :name => "index_group_comp_groups_on_module_id"

  create_table "g_comp_pages", :force => true do |t|
    t.integer  "page_id"
    t.integer  "comp_group_id"
    t.integer  "module_order"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "g_comp_pages", ["comp_group_id"], :name => "index_group_comp_pages_on_comp_group_id"
  add_index "g_comp_pages", ["page_id"], :name => "index_group_comp_pages_on_page_id"

  create_table "g_events", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "date"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "g_galleries", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.integer  "group_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "g_galleries", ["group_id"], :name => "index_g_galleries_on_group_id"

  create_table "g_images", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "g_images", ["group_id"], :name => "index_g_images_on_group_id"

  create_table "g_module_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "g_modules", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "module_type_id"
    t.integer  "module_id"
    t.text     "description"
    t.string   "image"
  end

  add_index "g_modules", ["module_id"], :name => "index_g_modules_on_module_id"
  add_index "g_modules", ["module_type_id"], :name => "index_g_modules_on_module_type_id"

  create_table "g_news", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.date     "date_exp"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "g_pages", :force => true do |t|
    t.text     "content"
    t.string   "url"
    t.integer  "page_order"
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "g_pages", ["group_id"], :name => "index_group_pages_on_group_id"

  create_table "g_paintings", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "gallery_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "g_paintings", ["gallery_id"], :name => "index_g_paintings_on_gallery_id"

  create_table "g_styles", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "type"
  end

  create_table "g_texts", :force => true do |t|
    t.text     "content"
    t.integer  "text_order"
    t.integer  "page_id"
    t.integer  "comp_page_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "g_texts", ["page_id"], :name => "index_g_texts_on_page_id"

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.string   "website"
    t.string   "street"
    t.string   "city"
    t.integer  "npa"
    t.integer  "canton_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "url"
    t.boolean  "website_activated", :default => false
    t.integer  "style_id"
  end

  add_index "groups", ["style_id"], :name => "index_group_groups_on_style_id"

  create_table "images", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "oauth_access_grants", :force => true do |t|
    t.integer  "resource_owner_id", :null => false
    t.integer  "application_id",    :null => false
    t.string   "token",             :null => false
    t.integer  "expires_in",        :null => false
    t.string   "redirect_uri",      :null => false
    t.datetime "created_at",        :null => false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], :name => "index_oauth_access_grants_on_token", :unique => true

  create_table "oauth_access_tokens", :force => true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id",    :null => false
    t.string   "token",             :null => false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        :null => false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], :name => "index_oauth_access_tokens_on_refresh_token", :unique => true
  add_index "oauth_access_tokens", ["resource_owner_id"], :name => "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], :name => "index_oauth_access_tokens_on_token", :unique => true

  create_table "oauth_applications", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "uid",          :null => false
    t.string   "secret",       :null => false
    t.string   "redirect_uri", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "oauth_applications", ["uid"], :name => "index_oauth_applications_on_uid", :unique => true

  create_table "ownership_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ownerships", :force => true do |t|
    t.integer  "element_id"
    t.integer  "user_id"
    t.integer  "ownership_type_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.boolean  "right_read"
    t.boolean  "right_create"
    t.boolean  "right_update"
    t.boolean  "right_delete"
    t.integer  "id_element"
  end

  add_index "ownerships", ["element_id"], :name => "index_ownerships_on_element_id"
  add_index "ownerships", ["ownership_type_id"], :name => "index_ownerships_on_ownership_type_id"
  add_index "ownerships", ["user_id"], :name => "index_ownerships_on_user_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "paintings", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "gallery_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "paintings", ["gallery_id"], :name => "index_paintings_on_gallery_id"

  create_table "parents", :force => true do |t|
    t.integer  "user_id"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "parents", ["parent_id"], :name => "index_parents_on_parent_id"
  add_index "parents", ["user_id"], :name => "index_parents_on_user_id"

  create_table "slideshows", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "link"
    t.date     "date_exp"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "email"
    t.integer  "user_type_id"
    t.string   "uid"
    t.string   "gravatar_email"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["uid"], :name => "index_users_on_uid"
  add_index "users", ["user_type_id"], :name => "index_users_on_user_type_id"

end
