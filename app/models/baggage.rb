class Baggage < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :deliveries
  belongs_to :user
  belongs_to :address

  validates :address_id, numericality: { other_than: 1, message: "can't be blank" }
end
