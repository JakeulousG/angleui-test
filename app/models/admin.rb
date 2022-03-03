class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  enum roles: [ "super admin", "admin", "staff" ] 

  has_one_attached :avatar
  has_one_attached :cover_photo

  validates :name, length: { minimum: 2, maximum: 50 }, presence: true
  validates :bio, length: { minimum: 2, maximum: 500 }, presence: true
end
