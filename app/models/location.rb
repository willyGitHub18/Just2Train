class Location < ApplicationRecord
  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events

  validates :street1, :city, :zip, presence: true
end
