class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.text :message
      t.integer :category, null: false
      t.references :player, foreign_key: true
      t.references :question, foreign_key: true
      t.text :url

      t.timestamps
    end
  end
end
