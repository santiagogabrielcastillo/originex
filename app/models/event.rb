class Event < ApplicationRecord
  belongs_to :activity
  belongs_to :chatroom
end
