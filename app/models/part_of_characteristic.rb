class PartOfCharacteristic < ApplicationRecord
  before_save :default_values

  belongs_to :characteristic, inverse_of: :part_of_characteristics
  has_many :weights,  :dependent => :destroy
  has_many :connections, inverse_of: :part_of_characteristic
  has_many :people, through: :characteristic_values
  validates :partname, presence: true
  validates :type_of_data,  presence: true
  validates :result_type,  presence: true
  # validates :characteristic_id
  private
  def default_values
    self.result_type = 1 # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  end
end
