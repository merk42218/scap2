class Address < ApplicationRecord
    has_many :characteristics, dependent: :destroy


    validates :name, presence: true, uniqueness: true
end
