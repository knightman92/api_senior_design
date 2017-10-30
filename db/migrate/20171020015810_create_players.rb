class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
    	t.string "first_name", :null => false
      t.string "last_name", :null => false
      t.string "email", :null => false
      t.string "encrypted_password", :null => false
      t.string "phone"
      t.integer "gender", :null => false
      t.integer "age", :null => false
      t.integer "coach_id"
      t.integer "points", :default => 0, :null => false
      t.integer "age_range", :null => false
      t.string "auth_token"
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer "sign_in_count"
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.belongs_to :coach
      t.timestamps
    end
  end
end
