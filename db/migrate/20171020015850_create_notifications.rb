class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.text "message"
      t.integer "question_id"
      t.text "url"
  	  t.belongs_to :question
      t.timestamps
    end
  end
end
