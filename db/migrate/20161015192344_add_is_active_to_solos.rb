class AddIsActiveToSolos < ActiveRecord::Migration[5.0]
  def change
    add_column :solos, :is_active, :boolean
  end
end
