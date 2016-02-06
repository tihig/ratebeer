class User < ActiveRecord::Base
  include RatingAverage 
  has_secure_password


  validates :username, uniqueness: true, length: { minimum: 3, maximum: 15 }
  validates :password, length: { minimum: 4}, format: {with: /\A(?=.*[A-Z]).+\z/}

  has_many :ratings, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :beers, through: :ratings
   
end
