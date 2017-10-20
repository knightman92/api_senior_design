class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer "category", :null => false
      t.integer "age_range", :null => false
      t.integer "gender", :null => false
      t.integer "question_type", :null => false
      t.text "options"
      t.text "question_text"
      t.integer "coach_id"
      t.integer "player_id"
      t.integer "patternMulti", :default => false
	    t.belongs_to :coach
	    t.belongs_to :player
      t.timestamps
    end
  end
end
