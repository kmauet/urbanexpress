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

ActiveRecord::Schema.define(version: 20170322012619) do

  create_table "badges_sashes", force: :cascade do |t|
    t.integer  "badge_id"
    t.integer  "sash_id"
    t.boolean  "notified_user", default: false
    t.datetime "created_at"
    t.index ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id"
    t.index ["badge_id"], name: "index_badges_sashes_on_badge_id"
    t.index ["sash_id"], name: "index_badges_sashes_on_sash_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.integer  "sash_id"
    t.integer  "level",                  default: 0
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_customers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "price"
    t.string   "permalink"
    t.string   "name"
    t.integer  "quote_id"
    t.integer  "customer_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.date     "date_needed"
    t.date     "date_reserved"
    t.time     "time_reserved"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.integer  "vehicule_id"
    t.text     "itinerary"
    t.boolean  "handicap_accessible"
    t.boolean  "public_availability"
    t.string   "method_of_pay"
    t.float    "rate"
    t.float    "sales_tax"
    t.float    "deposit"
    t.float    "amount_due"
    t.float    "additional_charges"
    t.float    "total_collected"
    t.boolean  "accepted"
    t.boolean  "payed"
    t.boolean  "emailsent"
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
    t.index ["quote_id"], name: "index_invoices_on_quote_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
    t.index ["vehicule_id"], name: "index_invoices_on_vehicule_id"
  end

  create_table "merit_actions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action_method"
    t.integer  "action_value"
    t.boolean  "had_errors",    default: false
    t.string   "target_model"
    t.integer  "target_id"
    t.text     "target_data"
    t.boolean  "processed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merit_activity_logs", force: :cascade do |t|
    t.integer  "action_id"
    t.string   "related_change_type"
    t.integer  "related_change_id"
    t.string   "description"
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: :cascade do |t|
    t.integer  "score_id"
    t.integer  "num_points", default: 0
    t.string   "log"
    t.datetime "created_at"
  end

  create_table "merit_scores", force: :cascade do |t|
    t.integer "sash_id"
    t.string  "category", default: "default"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "quote_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "customer_id"
    t.text     "email_hash"
    t.text     "to"
    t.text     "from"
    t.text     "cc"
    t.text     "subject"
    t.text     "raw_text"
    t.text     "raw_html"
    t.text     "raw_body"
    t.text     "attachments"
    t.text     "headers"
    t.text     "raw_headers"
    t.index ["customer_id"], name: "index_messages_on_customer_id"
    t.index ["quote_id"], name: "index_messages_on_quote_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "payola_affiliates", force: :cascade do |t|
    t.string   "code"
    t.string   "email"
    t.integer  "percent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payola_coupons", force: :cascade do |t|
    t.string   "code"
    t.integer  "percent_off"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",      default: true
  end

  create_table "payola_sales", force: :cascade do |t|
    t.string   "email",                limit: 191
    t.string   "guid",                 limit: 191
    t.integer  "product_id"
    t.string   "product_type",         limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.string   "stripe_id"
    t.string   "stripe_token"
    t.string   "card_last4"
    t.date     "card_expiration"
    t.string   "card_type"
    t.text     "error"
    t.integer  "amount"
    t.integer  "fee_amount"
    t.integer  "coupon_id"
    t.boolean  "opt_in"
    t.integer  "download_count"
    t.integer  "affiliate_id"
    t.text     "customer_address"
    t.text     "business_address"
    t.string   "stripe_customer_id",   limit: 191
    t.string   "currency"
    t.text     "signed_custom_fields"
    t.integer  "owner_id"
    t.string   "owner_type",           limit: 100
    t.index ["coupon_id"], name: "index_payola_sales_on_coupon_id"
    t.index ["email"], name: "index_payola_sales_on_email"
    t.index ["guid"], name: "index_payola_sales_on_guid"
    t.index ["owner_id", "owner_type"], name: "index_payola_sales_on_owner_id_and_owner_type"
    t.index ["product_id", "product_type"], name: "index_payola_sales_on_product"
    t.index ["stripe_customer_id"], name: "index_payola_sales_on_stripe_customer_id"
  end

  create_table "payola_stripe_webhooks", force: :cascade do |t|
    t.string   "stripe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payola_subscriptions", force: :cascade do |t|
    t.string   "plan_type"
    t.integer  "plan_id"
    t.datetime "start"
    t.string   "status"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "stripe_customer_id"
    t.boolean  "cancel_at_period_end"
    t.datetime "current_period_start"
    t.datetime "current_period_end"
    t.datetime "ended_at"
    t.datetime "trial_start"
    t.datetime "trial_end"
    t.datetime "canceled_at"
    t.integer  "quantity"
    t.string   "stripe_id"
    t.string   "stripe_token"
    t.string   "card_last4"
    t.date     "card_expiration"
    t.string   "card_type"
    t.text     "error"
    t.string   "state"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency"
    t.integer  "amount"
    t.string   "guid",                 limit: 191
    t.string   "stripe_status"
    t.integer  "affiliate_id"
    t.string   "coupon"
    t.text     "signed_custom_fields"
    t.text     "customer_address"
    t.text     "business_address"
    t.integer  "setup_fee"
    t.decimal  "tax_percent",                      precision: 4, scale: 2
    t.index ["guid"], name: "index_payola_subscriptions_on_guid"
  end

  create_table "quotes", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "service_type"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "type"
    t.integer  "customer_id"
    t.string   "organization"
    t.string   "address"
    t.string   "extension"
    t.date     "departure_date"
    t.time     "departure_time"
    t.string   "departure_address"
    t.string   "destination_address"
    t.integer  "vehicule_type"
    t.text     "itinirary"
    t.text     "additional_notes"
    t.integer  "total_num_of_days"
    t.date     "return_date"
    t.time     "return_time"
    t.integer  "num_of_passengers"
    t.integer  "num_of_bags"
    t.string   "airport"
    t.string   "flight_num"
    t.string   "pay_method"
    t.time     "flight_departure_time"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "sashes", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.boolean  "admin"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "active"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicule_images", force: :cascade do |t|
    t.integer  "vehicule_id"
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "vehicules", force: :cascade do |t|
    t.string   "name"
    t.string   "vehicule_type"
    t.text     "info"
    t.boolean  "tv"
    t.boolean  "bathroom"
    t.boolean  "dvd_player"
    t.boolean  "cd_player"
    t.boolean  "am_fm_radio"
    t.boolean  "cooler"
    t.boolean  "nav_system"
    t.boolean  "sound_system"
    t.boolean  "wheelchair"
    t.boolean  "bluetooth"
    t.boolean  "leather"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "display_image"
    t.string   "seats"
  end

end
