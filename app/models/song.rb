class Song < ApplicationRecord
  # NHO: recommend adding dependent: :destroy to all these relationships to prevent orphaned records!
  
  # Solos
  has_many :solos
  has_many :users, through: :solos

  # Arrangements
  has_many :arrangements
  has_many :users, through: :arrangements

end
