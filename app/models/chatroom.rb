class Chatroom < ApplicationRecord
  belongs_to :activity
  has_many :messages

  validates :title, :description, presence: true
end
