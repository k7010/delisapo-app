class Baggage < ApplicationRecord
  has_many :deliveries
  belongs_to :user

end
