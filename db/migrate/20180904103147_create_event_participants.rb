class CreateEventParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :event_participants do |t|
      t.boolean :is_creator, default: true
      t.boolean :is_admin, default: true
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
  end
end
