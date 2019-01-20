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

ActiveRecord::Schema.define(version: 20190120103933) do

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "name",       limit: 65535
    t.integer  "item_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["item_id"], name: "index_brands_on_item_id", using: :btree
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "number",                null: false
    t.integer  "expiration_date_month", null: false
    t.integer  "expiration_date_year",  null: false
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["user_id"], name: "index_cards_on_user_id", using: :btree
  end

  create_table "evaluations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "buyer"
    t.text     "comment",    limit: 65535
    t.integer  "value"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_evaluations_on_user_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "name",       limit: 65535, null: false
    t.integer  "item_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["item_id"], name: "index_images_on_item_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                  null: false
    t.text     "details",                 limit: 65535, null: false
    t.string   "condition",                             null: false
    t.integer  "price",                                 null: false
    t.string   "size"
    t.string   "shipping_charge_borne",                 null: false
    t.string   "shipping_method",                       null: false
    t.string   "shipment_source_area",                  null: false
    t.string   "estimated_shipping_date",               null: false
    t.integer  "user_id"
    t.integer  "buyer_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["condition"], name: "index_items_on_condition", using: :btree
    t.index ["name"], name: "index_items_on_name", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_likes_on_item_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "trades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "deposit"
    t.integer  "shipping_notification"
    t.integer  "item_id"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["item_id"], name: "index_trades_on_item_id", using: :btree
    t.index ["user_id"], name: "index_trades_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                            null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name",                          null: false
    t.string   "family_name",                         null: false
    t.string   "first_name_kana",                     null: false
    t.string   "family_name_kana",                    null: false
    t.integer  "postal_code",                         null: false
    t.string   "prefecture",                          null: false
    t.string   "city",                                null: false
    t.string   "address_first",                       null: false
    t.string   "address_second",                      null: false
    t.string   "telephone",                           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "brands", "items"
  add_foreign_key "cards", "users"
  add_foreign_key "evaluations", "users"
  add_foreign_key "images", "items"
  add_foreign_key "items", "users"
  add_foreign_key "likes", "items"
  add_foreign_key "likes", "users"
  add_foreign_key "trades", "items"
  add_foreign_key "trades", "users"
end
