class Baggage < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :deliveries
  belongs_to :user


end
