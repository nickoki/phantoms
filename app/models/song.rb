class Song < ApplicationRecord

  # Solos
  has_many :solos
  has_many :users, through: :solos

  # Arrangements
  has_many :arrangements
  has_many :users, through: :arrangements

end
