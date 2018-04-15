class Component < ApplicationRecord
  belongs_to :characteristic
  belongs_to :part_of_characteristics
end
