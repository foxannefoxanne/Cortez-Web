class InitSchema < ActiveRecord::Migration
  def up
    
    create_table "users", force: :cascade do |t|
      t.string   "name"
      t.string   "email"
      t.datetime "created_at",                      null: false
      t.datetime "updated_at",                      null: false
      t.string   "password_digest"
      t.string   "remember_digest"
      t.boolean  "admin",           default: false
    end
    
    add_index "users", ["email"], name: "index_users_on_email", unique: true
    
    create_table "maps", force: :cascade do |t|
      t.string   "title"
      t.string   "description"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end
    
    create_table "pins", force: :cascade do |t|
      t.string   "title"
      t.string   "description"
      t.string   "address"
      t.float    "latitude"
      t.float    "longitude"
      t.integer  "map_id"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end
    
  end

  def down
    raise "Can not revert initial migration"
  end
end
