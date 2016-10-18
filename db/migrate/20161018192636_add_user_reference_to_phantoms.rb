class AddUserReferenceToPhantoms < ActiveRecord::Migration[5.0]
  def change
    add_reference :phantoms, :user, index: true
    add_foreign_key :phantoms, :users
  end
end
