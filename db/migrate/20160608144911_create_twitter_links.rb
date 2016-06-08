class CreateTwitterLinks < ActiveRecord::Migration
  def change
    create_table :twitter_links do |t|
      t.string :first
      t.string :second
      t.boolean :deleted

      t.timestamps
    end
  end
end
