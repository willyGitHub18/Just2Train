class Activity < ApplicationRecord
  has_many :events
  has_many :users, through: :user_activities
end
