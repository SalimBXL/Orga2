class User < ApplicationRecord
    has_secure_password
    belongs_to :service
    belongs_to :groupe

    has_many :resources, -> { order(:name) }

    
    validates :email, presence: true
    validates :email, uniqueness: true
    normalizes :email, with: ->(email) {email.strip.downcase}

    validates :firstname, presence: true
    normalizes :firstname, with: ->(firstname) {firstname.strip.titleize}

    validates :lastname, presence: true
    normalizes :lastname, with: ->(lastname) {lastname.strip.titleize}

    generates_token_for :password_reset, expires_in: 15.minutes do
        password_salt&.last(10)
    end

    generates_token_for :email_confirmation, expires_in: 24.hours do
        email
    end

    validates :groupe, presence: true
    validates :service, presence: true
    
    validates :administrator, presence: true
    validates :manager, presence: true


    scope :actives, -> { where(inactive: false) }
    scope :managers, -> { where(manager: true) }


    def resources
        Resource.where(referent: self)
    end

    def isManager?
        self.manager
    end

    def isAdministrator?
        self.administrator
    end

    def isActive?
        !self.inactive
    end

    def isInactive?
        self.inactive
    end

    def fullname
        "#{self.firstname[0].upcase}. #{self.lastname.titleize}"
    end

    private

    
    
end
