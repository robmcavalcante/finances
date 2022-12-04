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

ActiveRecord::Schema[7.0].define(version: 2022_12_04_140137) do
  create_table "cards", force: :cascade do |t|
    t.string "description", limit: 30
    t.string "flag", limit: 20
    t.float "limit"
    t.string "closure", limit: 2
    t.string "expiration", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "description", limit: 20
    t.string "color", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string "description", limit: 50
    t.string "date", limit: 8
    t.float "value"
    t.integer "status", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "icons", force: :cascade do |t|
    t.string "value", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string "reference", limit: 6
    t.float "value"
    t.integer "status", limit: 1
    t.integer "card_id", null: false
    t.integer "expense_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_invoices_on_card_id"
    t.index ["expense_id"], name: "index_invoices_on_expense_id"
  end

  create_table "revenues", force: :cascade do |t|
    t.string "description", limit: 50
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string "description", limit: 50
    t.string "date", limit: 8
    t.float "value"
    t.integer "category_id", null: false
    t.integer "invoice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_transactions_on_category_id"
    t.index ["invoice_id"], name: "index_transactions_on_invoice_id"
  end

  add_foreign_key "invoices", "cards"
  add_foreign_key "invoices", "expenses"
  add_foreign_key "transactions", "categories"
  add_foreign_key "transactions", "invoices"
end
