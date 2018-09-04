class Event < ApplicationRecord
  belongs_to :location
  belongs_to :activity
  has_many :event_participants, dependent: :destroy
  has_many :users, through: :event_participants

  # When testing the presence of foreign key it is necessary to use :model
  validates :name, :date, :time, :location, :activity, presence: true
end
