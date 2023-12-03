class Resource < ApplicationRecord
  belongs_to :service
  belongs_to :referent, class_name: "User"
  belongs_to :groupe, class_name: "ResourceGroupe"

  validates :name, presence: true
  validates :name, uniqueness: true
  normalizes :name, with: ->(name) {name.strip.titleize}

  scope :here, -> { where(service: Current.user.service) }
  scope :for_referent, -> (ref) { where(referent: ref).order(:name) }
  scope :for_groupe, -> (gr) { where(groupe: gr).order(:name) }

end
