class Record < ApplicationRecord
  belongs_to :pet
  has_many_attached :images
  has_many_attached :files
end
