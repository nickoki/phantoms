class Song < ApplicationRecord

  has_many :users
  has_many :songs, through: :solos

end
