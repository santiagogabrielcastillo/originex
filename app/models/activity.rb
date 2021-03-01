class Activity < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_over_activities,
                  against: %i[ title category address ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
