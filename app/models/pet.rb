class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :vet, class_name: 'User'
  has_many :bookings, dependent: :destroy
  has_many :posts
  has_many :records
  has_many :messages

  has_one_attached :avatar_pic
end
