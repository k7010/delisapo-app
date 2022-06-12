class Delivery < ApplicationRecord
  belongs_to :user
  belongs_to :baggage

  validates :delivery_result, presence: true
end
