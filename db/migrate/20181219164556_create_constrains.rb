class CreateConstrains < ActiveRecord::Migration[5.2]
  def change
    create_table :constrains, id: false do |t|
      t.integer :customizable_option_id, name: 'index_option'
      t.integer :constrain_customizable_option_id, name: 'index_constrain'
    end

    add_index(:constrains, [:customizable_option_id, :constrain_customizable_option_id], :unique => true, name: 'index_constrains_on_option_id_and_constrain_option_id')
    add_index(:constrains, [:constrain_customizable_option_id, :customizable_option_id], :unique => true, name: 'index_constrains_on_constrain_option_id_and_option_id')
  end
end
