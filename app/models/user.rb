class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: {minimum: 1,maximum: 20},presence: true
  validates :int, length: {maximum: 50},presence: true

  has_many :books,dependent: :destroy
  attachment :profile_image

end
