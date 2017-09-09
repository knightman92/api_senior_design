class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, unique: true
      t.string :encrypted_password, null: false
      t.string :phone
      t.integer :gender, null: false
      t.integer :points, null: false
      t.integer :age, null: false
      t.references :coach, foreign_key: true

      t.timestamps
    end
  end
end
