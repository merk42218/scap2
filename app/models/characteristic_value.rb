class CharacteristicValue < ApplicationRecord
  belongs_to :part_of_characteristic, inverse_of: :characteristic_values
  belongs_to :person, inverse_of: :characteristic_values

  validates :part_of_characteristic_id, presence: true
  validates :person_id, presence: true
  validates :time, presence: true
end
