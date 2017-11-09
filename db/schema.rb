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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171109211330) do

  create_table "admins", force: true do |t|
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
    t.string   "name"
    t.integer  "role"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "enderecos", force: true do |t|
    t.string   "rua"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "uf"
    t.integer  "cep"
    t.string   "referencia"
    t.string   "numero"
    t.string   "complemento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pedido_produtos", force: true do |t|
    t.integer  "pedido_id"
    t.integer  "produto_id"
    t.float    "contador",    default: 1.0, null: false
    t.string   "tipo_medida", default: "1", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pedido_produtos", ["pedido_id"], name: "index_pedido_produtos_on_pedido_id"
  add_index "pedido_produtos", ["produto_id"], name: "index_pedido_produtos_on_produto_id"

  create_table "pedidos", force: true do |t|
    t.integer  "status",                   null: false
    t.float    "numero_nf"
    t.float    "total",      default: 0.0, null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produtos", force: true do |t|
    t.string   "produto"
    t.integer  "qtd_estoque"
    t.string   "desc_produto"
    t.float    "valor_pago"
    t.float    "valor_venda"
    t.integer  "tipo_produto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_url"
  end

  create_table "tipo_produtos", force: true do |t|
    t.string   "nome_tipo"
    t.string   "desc_tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "tel_fixo"
    t.string   "tel_cel"
    t.integer  "endereco_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["endereco_id"], name: "index_users_on_endereco_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["token"], name: "index_users_on_token"

end
