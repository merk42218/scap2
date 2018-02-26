class PartOfCharacteristic < ApplicationRecord
  belongs_to :characteristic, inverse_of: :part_of_characteristics
  has_many :weights,  :dependent => :destroy
  has_many :characteristic_values, inverse_of: :part_of_characteristic
  validates :partname, presence: true
  # validates :characteristic_id

end
