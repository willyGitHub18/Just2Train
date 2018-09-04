class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :category
      t.string :place_name
      t.string :street1
      t.string :street2
      t.string :city
      t.string :zip

      t.timestamps
    end
  end
end
