class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image_url
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
