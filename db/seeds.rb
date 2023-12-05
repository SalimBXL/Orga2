# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



# Création données de base
Location.create(
    name: "Unknown Place",
    address: ""
)
Service.create(
    name: "PETScan ULB Erasme",
    comment: "",
    location: Location.last
)
Groupe.create(
    name: "Radiophysique",
    comment: ""
)

# Création de resources
ResourceGroupe.create(
    name: "Activity meter",
    description: "Activimètres de mesures de doses"
)
ResourceGroupe.create(
    name: "Camera",
    description: "Tomographes"
)

Resource.create(
    name: "Trasis Unidose",
    description: "Dispenseur de doses.",
    service: Service.last,
    referent: User.last,
    groupe: ResourceGroupe.first
)
Resource.create(
    name: "Vereos",
    description: "PET/CT",
    service: Service.last,
    referent: User.last,
    groupe: ResourceGroupe.last
)
Resource.create(
    name: "TF",
    description: "PET/CT",
    service: Service.last,
    referent: User.last,
    groupe: ResourceGroupe.last
)
Resource.create(
    name: "StarGuide",
    description: "SPECT-CT",
    service: Service.last,
    referent: User.last,
    groupe: ResourceGroupe.last
)


user_regular = User.where(email: "regular@user").first_or_initialize
user_regular.update!(
    role: :regular,
    password: "password",
    password_confirmation: "password",
    firstname: "Regular",
    lastname: "User",
    service: Service.last,
    groupe: Groupe.last,
    manager: false
)

# Création du profil Admin
user_admin = User.where(email: "admin@user").first_or_initialize
user_admin.update!(
    role: :admin,
    password: "password",
    password_confirmation: "password",
    firstname: "Admin",
    lastname: "Administrator",
    service: Service.last,
    groupe: Groupe.last,
    manager: true
)