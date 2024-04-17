class CreateDataModels < ActiveRecord::Migration[7.0]
  def change
    create_table :data_models do |t|
      t.string :name
      t.text :data
      t.string :full_phone_number
      t.timestamps
    end
  end
end
