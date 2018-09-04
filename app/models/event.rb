class Event < ApplicationRecord
  belongs_to :location
  belongs_to :activity
  has_many :users, through: :event_participants
end
