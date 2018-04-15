class Person < ApplicationRecord
  has_many :characteristic_values, inverse_of: :person
  # has_many :characteristic, through: :part_of_characteristics

  validates :name, presence: true, uniqueness: true

end
