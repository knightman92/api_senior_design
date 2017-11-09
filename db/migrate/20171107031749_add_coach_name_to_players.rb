class AddCoachNameToPlayers < ActiveRecord::Migration[5.0]
  def change  
  	add_column :players, :coach_name, :string	
  end
end