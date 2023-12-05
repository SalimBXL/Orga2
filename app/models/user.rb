class User < ApplicationRecord
    enum role: [:regular, :admin]
    
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :trackable, :registerable,
            :recoverable, :rememberable, :validatable

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

    validates :groupe, presence: true
    validates :service, presence: true

    scope :actives, -> { where(inactive: false) }
    scope :managers, -> { where(manager: true) }

    scope :here, -> { where(service: Current.user.service) }


    def resources
        Resource.where(referent: self)
    end

    def manager?
        self.manager
    end

    def active?
        !self.inactive
    end

    def inactive?
        self.inactive
    end

    def fullname
        "#{self.firstname[0].upcase}. #{self.lastname.titleize}"
    end

    def completeFullname
        "#{self.firstname.titleize} #{self.lastname.titleize}"
    end

    private

    
    
end
