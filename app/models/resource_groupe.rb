class ResourceGroupe < ApplicationRecord
    has_many :resources
    
    validates :name, presence: true
    validates :name, uniqueness: true
    normalizes :name, with: ->(name) {name.strip.titleize}

    def resources
        Resource.where(groupe: self)
    end
end
