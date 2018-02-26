class Address < ApplicationRecord
    has_many :characteristics


    validates :name, presence: true, uniqueness: true
end
