class CreateJoinTableBikeCustomizable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :bikes, :customizables do |t|
      t.index [:bike_id, :customizable_id]
      t.index [:customizable_id, :bike_id]
    end
  end
end
