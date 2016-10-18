class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.datetime :debut_date
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
