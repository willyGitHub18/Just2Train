class Activity < ApplicationRecord
  has_many :events
  has_many :user_activities, dependent: :destroy
  has_many :users, through: :user_activities

  validates :activity_name, presence: true
end
