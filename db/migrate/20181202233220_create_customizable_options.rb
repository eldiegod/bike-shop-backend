class CreateCustomizableOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :customizable_options do |t|
      # t.string :options, array: true, default: []
      t.references :customizable, foreign_key: true
      
      t.timestamps
    end
  end
end
