class League < ApplicationRecord
  belongs_to :country
  has_many :seasons, dependent: :destroy
  has_many :games, through: :seasons
end
