class CreateBikeOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :bike_orders do |t|
      t.references :bike
      t.references :order

      t.timestamps
    end
  end
end
