class CreateArrangements < ActiveRecord::Migration[5.0]
  def change
    create_table :arrangements do |t|
      t.references :user, index: true, foreign_key: true
      t.references :song, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
