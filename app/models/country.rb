class Country < ApplicationRecord
  has_many :leagues, dependent: :destroy
  has_many :seasons, through: :leagues
  has_many :teams, through: :seasons
end
