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

ActiveRecord::Schema[8.1].define(version: 2025_11_01_165842) do
  create_table "carta", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "imagen_url"
    t.string "nombre"
    t.string "rareza"
    t.string "tipo"
    t.datetime "updated_at", null: false
  end

  create_table "compras", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "cantidad"
    t.bigint "comprador_id", null: false
    t.datetime "created_at", null: false
    t.bigint "publicacion_id", null: false
    t.decimal "total", precision: 10
    t.datetime "updated_at", null: false
    t.index ["comprador_id"], name: "index_compras_on_comprador_id"
    t.index ["publicacion_id"], name: "index_compras_on_publicacion_id"
  end

  create_table "historial_precios", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "carta_id", null: false
    t.datetime "created_at", null: false
    t.datetime "fecha"
    t.decimal "precio", precision: 10
    t.datetime "updated_at", null: false
    t.index ["carta_id"], name: "index_historial_precios_on_carta_id"
  end

  create_table "publicacions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "carta_id", null: false
    t.datetime "created_at", null: false
    t.string "estado"
    t.decimal "precio", precision: 10
    t.datetime "updated_at", null: false
    t.bigint "usuario_id", null: false
    t.index ["carta_id"], name: "index_publicacions_on_carta_id"
    t.index ["usuario_id"], name: "index_publicacions_on_usuario_id"
  end

  create_table "usuarios", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "nombre"
    t.string "password_digest"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "compras", "publicacions"
  add_foreign_key "compras", "usuarios", column: "comprador_id"
  add_foreign_key "historial_precios", "carta", column: "carta_id"
  add_foreign_key "publicacions", "carta", column: "carta_id"
  add_foreign_key "publicacions", "usuarios"
end
