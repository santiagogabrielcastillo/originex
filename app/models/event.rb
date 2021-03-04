class Event < ApplicationRecord
  belongs_to :activity
  belongs_to :chatroom
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :details, :status, :date, presence: true
end
