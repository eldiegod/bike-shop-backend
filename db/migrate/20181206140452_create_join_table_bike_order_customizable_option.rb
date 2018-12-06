class CreateJoinTableBikeOrderCustomizableOption < ActiveRecord::Migration[5.2]
  def change
    create_join_table :bike_orders, :customizable_options do |t|
      t.index [:bike_order_id, :customizable_option_id], name: 'index_bike_order_customizable_option' 
      t.index [:customizable_option_id, :bike_order_id], name: 'index_customizable_option_bike_order' 
    end
  end
end
