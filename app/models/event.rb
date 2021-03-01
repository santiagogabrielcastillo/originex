class Event < ApplicationRecord
  belongs_to :activities
  belongs_to :chatrooms
end
