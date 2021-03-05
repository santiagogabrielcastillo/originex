class Activity < ApplicationRecord
  has_many :chatrooms, dependent: :destroy
  has_many :events, through: :chatrooms
  has_many :user_interests
  has_many :users, through: :user_interests
  has_one_attached :photo

  validates :title, :description, :category, presence: true
  
  include PgSearch::Model
  pg_search_scope :search_over_activities,
                  against: %i[ title category zone ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
