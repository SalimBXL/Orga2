class Service < ApplicationRecord
    belongs_to :location
    has_many :users
    
    validates :name, presence: true
    validates :name, uniqueness: true
    normalizes :name, with: ->(name) {name.strip.titleize}
    normalizes :comment, with: ->(comment) {comment.strip.titleize}

end
