class InformationSystem < ApplicationRecord
  include Lfj
  has_many :characteristics
  accepts_nested_attributes_for :characteristics, allow_destroy: true
  validates :name, presence: true, uniqueness: true
end
