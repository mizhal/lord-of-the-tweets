class CreateConfigs < ActiveRecord::Migration
  def change
    create_table :configs do |t|
      t.string :key
      t.string :value
      t.boolean :active

      t.timestamps null: false
    end
  end
end
