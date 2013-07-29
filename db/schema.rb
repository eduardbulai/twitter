ActiveRecord::Schema.define(version: 20130727000913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "afinn_scores", force: true do |t|
    t.string   "term"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "afinn_scores", ["term"], name: "index_afinn_scores_on_term", using: :btree

  create_table "queries", force: true do |t|
    t.integer  "user_id"
    t.string   "query_term"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "queries", ["user_id"], name: "index_queries_on_user_id", using: :btree

  create_table "query_results", force: true do |t|
    t.integer  "query_id"
    t.string   "word"
    t.integer  "frequency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "query_results", ["query_id"], name: "index_query_results_on_query_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end