class CreatePlayerNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :player_notifications do |t|
      t.integer "notification_id"
      t.integer "player_id"
    	t.integer "counter", :default => 0
    	t.integer "received", :null => false
	    t.belongs_to :notification
	    t.belongs_to :player
      t.timestamps
    end
  end
end
