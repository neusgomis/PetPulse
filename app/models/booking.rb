class Booking < ApplicationRecord
  belongs_to :vet, class_name: 'User'
  belongs_to :pet
end
