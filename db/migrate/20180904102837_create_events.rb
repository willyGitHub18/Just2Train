class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.decimal :price, default: 0.0
      t.date :date
      t.integer :nb_participant
      t.integer :level
      t.time :time
      t.integer :activity_id
      t.integer :location_id

      t.timestamps
    end
  end
end
