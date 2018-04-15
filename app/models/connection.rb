class Connection < ApplicationRecord
  belongs_to :characteristic
  has_many :characteristic_values, inverse_of: :connection

end
