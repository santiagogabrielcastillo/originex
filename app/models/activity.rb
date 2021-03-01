class Activity < ApplicationRecord
  has_many :chatrooms, dependent: :destroy
  
  include PgSearch::Model
  pg_search_scope :search_over_activities,
                  against: %i[ title category address ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
