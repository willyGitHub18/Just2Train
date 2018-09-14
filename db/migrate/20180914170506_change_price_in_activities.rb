class ChangePriceInActivities < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:events, :price, nil)
  end
end
