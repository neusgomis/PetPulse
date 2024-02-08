class Message < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates_presence_of :content
end
