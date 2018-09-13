class User < ApplicationRecord
  has_many :user_activities, dependent: :destroy
  has_many :activities, through: :user_activities
  has_many :event_participants, dependent: :destroy
  has_many :events, through: :event_participants
  has_many :messages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, length: { in: 3..20 }
  validates :phone, presence: true, format: { with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/, message: "phone number format not recognized" }
  validates :biography, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
end

