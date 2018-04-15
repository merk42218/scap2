class CharacteristicValue < ApplicationRecord
  belongs_to :connection
  belongs_to :person, inverse_of: :characteristic_values
  belongs_to :part_of_characteristic

  # validates :part_of_characteristic_id, presence: true
  # validates :person_id, presence: true
  validates :time, presence: true
end
