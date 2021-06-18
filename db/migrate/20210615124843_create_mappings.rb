class CreateMappings < ActiveRecord::Migration[6.1]
  def change
    create_table :mappings do |t|
      t.string :map_name, null: false

      t.timestamps
    end
  end
end
