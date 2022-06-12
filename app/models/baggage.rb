class Baggage < ApplicationRecord
  has_many :deliveries
  belongs_to :user

  with_options presence: true do
    validates :address
    validates :block
    validates :family_name
    validates :first_name
    validates :time_specification
  end

end
