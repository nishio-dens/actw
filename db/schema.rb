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

ActiveRecord::Schema.define(version: 0) do

  create_table "auto_coordination_job_histories", force: :cascade, comment: "自動連携ジョブ履歴" do |t|
    t.integer  "coordination_id",    limit: 4,  null: false, comment: "自動連携ID"
    t.string   "job_id",             limit: 40, null: false, comment: "ジョブID"
    t.string   "job_status_id",      limit: 10, null: false, comment: "ジョブステータス"
    t.string   "request_program_id", limit: 10,              comment: "要求元プログラム"
    t.datetime "finished_at",                                comment: "ジョブ実行完了日時"
    t.datetime "created_at",                    null: false, comment: "作成日時"
    t.datetime "updated_at",                    null: false, comment: "更新日時"
  end

  add_index "auto_coordination_job_histories", ["coordination_id"], name: "auto_coordination_job_histories_coordination_id_fk", using: :btree

  create_table "categories", force: :cascade, comment: "カテゴリ" do |t|
    t.string   "name",       limit: 255,                null: false, comment: "カテゴリ名"
    t.boolean  "selectable", limit: 1,   default: true, null: false, comment: "ユーザが選択可能"
    t.datetime "created_at",                            null: false, comment: "作成日時"
    t.datetime "updated_at",                            null: false, comment: "更新日時"
  end

  create_table "coordination_conditions", force: :cascade, comment: "自動連携条件" do |t|
    t.integer  "coordination_id", limit: 4,   null: false, comment: "自動連携ID"
    t.string   "condition_key",   limit: 50,  null: false, comment: "連携条件キー"
    t.string   "predicate",       limit: 10,  null: false, comment: "検索述語"
    t.string   "condition_value", limit: 255, null: false, comment: "条件値"
    t.datetime "created_at",                  null: false, comment: "作成日時"
    t.datetime "updated_at",                  null: false, comment: "更新日時"
  end

  add_index "coordination_conditions", ["coordination_id"], name: "coordination_conditions_coordination_id_fk", using: :btree

  create_table "coordination_exclude_conditions", force: :cascade, comment: "自動連携除外条件" do |t|
    t.integer  "coordination_id", limit: 4,   null: false, comment: "自動連携ID"
    t.string   "condition_key",   limit: 50,  null: false, comment: "連携条件キー"
    t.string   "predicate",       limit: 10,  null: false, comment: "検索述語"
    t.string   "condition_value", limit: 255, null: false, comment: "条件値"
    t.datetime "created_at",                  null: false, comment: "作成日時"
    t.datetime "updated_at",                  null: false, comment: "更新日時"
  end

  add_index "coordination_exclude_conditions", ["coordination_id"], name: "coordination_exclude_conditions_coordination_id_fk", using: :btree

  create_table "coordination_filters", force: :cascade, comment: "自動連携登録先フィルタ" do |t|
    t.integer  "coordination_id", limit: 4, null: false, comment: "自動連携ID"
    t.integer  "filter_id",       limit: 4, null: false, comment: "フィルタID"
    t.datetime "created_at",                null: false, comment: "作成日時"
    t.datetime "updated_at",                null: false, comment: "更新日時"
  end

  add_index "coordination_filters", ["coordination_id"], name: "coordination_filters_coordination_id_fk", using: :btree
  add_index "coordination_filters", ["filter_id"], name: "coordination_filters_filter_id_fk", using: :btree

  create_table "coordinations", force: :cascade, comment: "自動連携" do |t|
    t.integer  "user_id",           limit: 4,                    null: false, comment: "ユーザID"
    t.string   "title",             limit: 255,                  null: false, comment: "連携名"
    t.text     "url",               limit: 65535,                             comment: "連携先URL"
    t.string   "coordination_type", limit: 20,                   null: false, comment: "連携先タイプ"
    t.boolean  "tagging",           limit: 1,     default: true, null: false, comment: "タグ付け"
    t.integer  "category_id",       limit: 4,                                 comment: "カテゴリID"
    t.boolean  "coordination",      limit: 1,     default: true, null: false, comment: "自動連携ON/OFF"
    t.datetime "last_updated_at",                                             comment: "最終連携日時"
    t.datetime "created_at",                                     null: false, comment: "作成日時"
    t.datetime "updated_at",                                     null: false, comment: "更新日時"
  end

  add_index "coordinations", ["category_id"], name: "coordinations_category_id_fk", using: :btree
  add_index "coordinations", ["user_id"], name: "coordinations_user_id_fk", using: :btree

  create_table "filters", force: :cascade, comment: "フィルタ" do |t|
    t.string   "name",           limit: 255,                null: false, comment: "フィルタ名"
    t.integer  "display_order",  limit: 4,   default: 1,    null: false, comment: "表示順"
    t.boolean  "display_mypage", limit: 1,   default: true, null: false, comment: "マイページ表示"
    t.integer  "data_count",     limit: 4,   default: 0,    null: false, comment: "データ数"
    t.integer  "user_id",        limit: 4,                  null: false, comment: "ユーザID"
    t.datetime "created_at",                                null: false, comment: "作成日時"
    t.datetime "updated_at",                                null: false, comment: "更新日時"
  end

  add_index "filters", ["user_id"], name: "filters_user_id_fk", using: :btree

  create_table "product_filters", force: :cascade, comment: "成果物/フィルタ関連" do |t|
    t.integer  "product_id", limit: 4, null: false, comment: "成果物ID"
    t.integer  "filter_id",  limit: 4, null: false, comment: "フィルタID"
    t.datetime "created_at",           null: false, comment: "作成日時"
    t.datetime "updated_at",           null: false, comment: "更新日時"
  end

  add_index "product_filters", ["filter_id"], name: "product_filters_filter_id_fk", using: :btree
  add_index "product_filters", ["product_id"], name: "product_filters_product_id_fk", using: :btree

  create_table "products", force: :cascade, comment: "成果物" do |t|
    t.string   "title",        limit: 255,                   null: false, comment: "タイトル"
    t.text     "url",          limit: 65535,                 null: false, comment: "URL"
    t.text     "description",  limit: 65535,                              comment: "概要"
    t.integer  "category_id",  limit: 4,                                  comment: "カテゴリID"
    t.integer  "user_id",      limit: 4,                     null: false, comment: "ユーザID"
    t.boolean  "manual",       limit: 1,     default: false, null: false, comment: "手動登録"
    t.datetime "published_at",                               null: false, comment: "公開日"
    t.datetime "created_at",                                 null: false, comment: "作成日時"
    t.datetime "updated_at",                                 null: false, comment: "更新日時"
  end

  add_index "products", ["category_id"], name: "products_category_id_fk", using: :btree
  add_index "products", ["user_id"], name: "products_user_id_fk", using: :btree

  create_table "taggings", force: :cascade, comment: "タギング" do |t|
    t.integer  "tag_id",        limit: 4,                comment: "タグID"
    t.integer  "taggable_id",   limit: 4,                comment: "タグ付け対象ID"
    t.string   "taggable_type", limit: 255,              comment: "タグ付け対象クラス"
    t.integer  "tagger_id",     limit: 4,                comment: "タグ所有者ID"
    t.string   "tagger_type",   limit: 255,              comment: "タグ所有者クラス"
    t.string   "context",       limit: 128,              comment: "タグ種別"
    t.datetime "created_at",                null: false, comment: "作成日時"
    t.datetime "updated_at",                null: false, comment: "更新日時"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_index", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_taggable_type_context", using: :btree

  create_table "tags", force: :cascade, comment: "タグ" do |t|
    t.string   "name",           limit: 255,             null: false, comment: "タグ名"
    t.integer  "taggings_count", limit: 4,   default: 0, null: false, comment: "タグ数"
    t.datetime "created_at",                             null: false, comment: "作成日時"
    t.datetime "updated_at",                             null: false, comment: "更新日時"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "user_category_summaries", force: :cascade, comment: "ユーザ/カテゴリ集計" do |t|
    t.integer  "user_id",     limit: 4,             null: false, comment: "ユーザID"
    t.integer  "category_id", limit: 4,             null: false, comment: "カテゴリID"
    t.integer  "data_count",  limit: 4, default: 0, null: false, comment: "集計数"
    t.datetime "created_at",                        null: false, comment: "作成日時"
    t.datetime "updated_at",                        null: false, comment: "更新日時"
  end

  add_index "user_category_summaries", ["category_id"], name: "user_category_summaries_category_id_fk", using: :btree
  add_index "user_category_summaries", ["user_id"], name: "user_category_summaries_user_id_fk", using: :btree

  create_table "user_profiles", force: :cascade, comment: "ユーザプロフィール" do |t|
    t.integer  "user_id",    limit: 4,     null: false, comment: "ユーザID"
    t.text     "profile",    limit: 65535,              comment: "プロフィール"
    t.datetime "created_at",               null: false, comment: "作成日時"
    t.datetime "updated_at",               null: false, comment: "更新日時"
  end

  add_index "user_profiles", ["user_id"], name: "user_profiles_user_id_fk", using: :btree

  create_table "users", force: :cascade, comment: "ユーザ" do |t|
    t.string   "name",                   limit: 255,              null: false, comment: "ユーザ名"
    t.string   "email",                  limit: 255,              null: false, comment: "メールアドレス"
    t.string   "encrypted_password",     limit: 255,              null: false, comment: "暗号化済パスワード"
    t.string   "reset_password_token",   limit: 255,                           comment: "リセットパスワードトークン"
    t.datetime "reset_password_sent_at",                                       comment: "リセットパスワード送信日"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false, comment: "ログイン数"
    t.datetime "current_sign_in_at",                                           comment: "最近ログインした日時"
    t.datetime "last_sign_in_at",                                              comment: "最後にログインした日時"
    t.string   "current_sign_in_ip",     limit: 255,                           comment: "最近ログインしたログイン元IP"
    t.string   "last_sign_in_ip",        limit: 255,                           comment: "最後にログインしたログイン元IP"
    t.string   "uid",                    limit: 255, default: "", null: false, comment: "UID"
    t.string   "provider",               limit: 255, default: "", null: false, comment: "プロバイダ"
    t.datetime "created_at",                                      null: false, comment: "作成日時"
    t.datetime "updated_at",                                      null: false, comment: "更新日時"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_provider", unique: true, using: :btree

  add_foreign_key "auto_coordination_job_histories", "coordinations", name: "auto_coordination_job_histories_coordination_id_fk"
  add_foreign_key "coordination_conditions", "coordinations", name: "coordination_conditions_coordination_id_fk"
  add_foreign_key "coordination_exclude_conditions", "coordinations", name: "coordination_exclude_conditions_coordination_id_fk"
  add_foreign_key "coordination_filters", "coordinations", name: "coordination_filters_coordination_id_fk"
  add_foreign_key "coordination_filters", "filters", name: "coordination_filters_filter_id_fk"
  add_foreign_key "coordinations", "categories", name: "coordinations_category_id_fk"
  add_foreign_key "coordinations", "users", name: "coordinations_user_id_fk"
  add_foreign_key "filters", "users", name: "filters_user_id_fk"
  add_foreign_key "product_filters", "filters", name: "product_filters_filter_id_fk"
  add_foreign_key "product_filters", "products", name: "product_filters_product_id_fk"
  add_foreign_key "products", "categories", name: "products_category_id_fk"
  add_foreign_key "products", "users", name: "products_user_id_fk"
  add_foreign_key "user_category_summaries", "categories", name: "user_category_summaries_category_id_fk"
  add_foreign_key "user_category_summaries", "users", name: "user_category_summaries_user_id_fk"
  add_foreign_key "user_profiles", "users", name: "user_profiles_user_id_fk"
end
