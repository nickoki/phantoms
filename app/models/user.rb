class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 # NHO: recommend adding dependent: :destroy to all these relationships
 # except maybe posts, to prevent orphaned records!

  # Solos
  has_many :solos
  has_many :songs, through: :solos

  # Arrangements
  has_many :arrangements
  has_many :songs, through: :arrangements

  # Phantom
  has_one :phantom

  # Posts
  has_many :posts

end
