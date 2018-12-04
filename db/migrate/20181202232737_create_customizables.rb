class CreateCustomizables < ActiveRecord::Migration[5.2]
  def change
    create_table :customizables do |t|
      t.string :name
      t.string :options, array: true, default: []

      t.timestamps
    end
  end
end
