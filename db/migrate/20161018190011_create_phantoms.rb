class CreatePhantoms < ActiveRecord::Migration[5.0]
  def change
    create_table :phantoms do |t|
      t.string :first_name
      t.string :last_name
      t.string :voice_part
      t.string :image_url
      t.text :bio
      t.datetime :join_date
      t.datetime :end_date
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
