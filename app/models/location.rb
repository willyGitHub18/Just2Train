class Location < ApplicationRecord
  has_many :events

  validates :street1, :city, :zip, presence: true
end
