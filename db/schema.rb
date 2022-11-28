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

ActiveRecord::Schema[7.0].define(version: 2022_11_25_234137) do
  create_table "cards", force: :cascade do |t|
    t.string "description", limit: 30
    t.string "flag", limit: 20
    t.integer "limit"
    t.string "closure", limit: 2
    t.string "expiration", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 20
    t.string "icon", limit: 75
    t.string "color", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string "month", limit: 2
    t.string "year", limit: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "description", limit: 20
    t.float "value"
    t.integer "transaction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_id"], name: "index_items_on_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "situation"
    t.string "date", limit: 8
    t.string "description", limit: 40
    t.float "value"
    t.integer "invoice_id", null: false
    t.integer "card_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_transactions_on_card_id"
    t.index ["category_id"], name: "index_transactions_on_category_id"
    t.index ["invoice_id"], name: "index_transactions_on_invoice_id"
  end

  add_foreign_key "items", "transactions"
  add_foreign_key "transactions", "cards"
  add_foreign_key "transactions", "categories"
  add_foreign_key "transactions", "invoices"
end
