class Chatroom < ApplicationRecord
  belongs_to :activity

  validates :title, :description, presence: true
end
