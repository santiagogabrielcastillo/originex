ZONES = ["Agronomía", "Almagro", "Balvanera", "Barracas", "Belgrano", "Boedo", "Caballito", "Chacarita", "Coghlan", "Colegiales", "Constitución", "Flores", "Floresta", "Boca", "Paternal", "Liniers", "Mataderos", "Monte Castro", "Monserrat", "Núñez", "Palermo", "Parque Avellaneda", "Parque Chacabuco", "Parque Chas", "Parque Patricios", "Puerto Madero", "Recoleta", "Retiro", "Saavedra", "San Cristóbal", "San Nicolás", "San Telmo", "Versalles", "Villa Crespo", "Villa del Parque", "Villa Devoto", "Villa General Mitre", "Villa Lugano", "Villa Luro", "Villa Ortúzar", "Villa Pueyrredón", "Villa Real", "Villa Riachuelo", "Villa Santa Rita", "Villa Soldati", "Villa Urquiza"]

class Activity < ApplicationRecord
  has_many :chatrooms, dependent: :destroy
  has_many :events, through: :chatrooms
  has_many :user_interests
  has_many :users, through: :user_interests

  validates :title, :description, :category, presence: true
  
  include PgSearch::Model
  pg_search_scope :search_over_activities,
                  against: %i[ title category zone ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
