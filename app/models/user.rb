class User < ApplicationRecord
  has_many :user_activities, dependent: :destroy
  has_many :activities, through: :user_activities
  has_many :event_participants, dependent: :destroy
  has_many :events, through: :event_participants

  validates :first_name, presence: true, length: { in: 2..30 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :last_name, presence: true, length: { in: 2..30 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  # validates :email, presence: true
  # validates :encrypted_password, presence: true, length: { minimum: 8 }
  validates :phone, presence: true, format: { with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/, message: "phone format not recognized" }
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
