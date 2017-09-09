class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :category, null: false
      t.integer :age_range, null: false
      t.integer :gender, null: false
      t.integer :question_type, null: false   #Free response or radio
      t.text :options
      t.text :question_text, null: false, unique: true
      t.references :coach, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
