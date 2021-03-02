class Event < ApplicationRecord
  belongs_to :activity
  belongs_to :chatroom

  validates :details, :status, :date, presence: true
end
