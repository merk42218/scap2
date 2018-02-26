class Person < ApplicationRecord
  has_many :characteristic_values, inverse_of: :person
  validates :name, presence: true, uniqueness: true

end
