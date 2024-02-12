class Booking < ApplicationRecord
 # belongs_to :vet, class_name: 'User'
  belongs_to :pet
  belongs_to :user
  def start_time
    return date_time
  end
  def time
    "#{date_time.strftime('%A, %b %d')}"
  end
end
