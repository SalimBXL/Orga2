class Location < ApplicationRecord
    has_many :services
    
    validates :name, presence: true
    validates :name, uniqueness: true
    normalizes :name, with: ->(name) {name.strip.titleize}
    normalizes :address, with: ->(comment) {comment.strip.capitalize}

end
