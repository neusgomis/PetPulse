class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :vet, class_name: 'User'
  has_many :bookings, :posts, :records, :messages, dependent: :destroy
end
