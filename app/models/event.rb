class Event < ApplicationRecord
  belongs_to :activity
  belongs_to :chatroom
  has_many :participants, through: :chatroom
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo

  validates :details, :status, :date, presence: true
end
