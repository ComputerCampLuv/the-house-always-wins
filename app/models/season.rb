class Season < ApplicationRecord
  belongs_to :league
  has_and_belongs_to_many :teams
  has_many :games, dependent: :destroy
end
