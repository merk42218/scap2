class Weight < ApplicationRecord
  belongs_to :part_of_characteristic

  validates :name, presence:true
  validates :weight, presence:true
  validates :part_of_characteristic_id, presence:true

end
