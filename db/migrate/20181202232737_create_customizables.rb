class CreateCustomizables < ActiveRecord::Migration[5.2]
  def change
    create_table :customizables do |t|
      t.string :name
      t.boolean :hasColors, default: true

      t.timestamps
    end

    create_table :customizable_options do |t|
      t.string :name
      t.references :customizable
      t.float :price, default: 0

      t.timestamps
    end
  end
end
