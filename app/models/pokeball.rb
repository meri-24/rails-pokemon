class Pokeball < ApplicationRecord
  belongs_to :trainer
  belongs_to :pokemon

  validates :trainer_id, presence: true
  validates :caught_on, presence: true
  validates :location, presence: true
  validates :pokemon_id, uniqueness: { scope: :trainer_id, message: "has already been caught by this trainer" }
end
