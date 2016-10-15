class Song < ApplicationRecord

  has_many :solos
  has_many :users, through: :solos

end
