class Chatroom < ApplicationRecord
  belongs_to :activity
  has_many :messages
  has_many :participants
  has_one :event
  has_many :users, through: :participants

  validates :title, :description, presence: true
end
