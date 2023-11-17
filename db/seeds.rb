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
    name: "None",
    comment: "",
    location: Location.last
)
Groupe.create(
    name: "None",
    comment: ""
)

# Création du profil Admin
User.create(
    email: "anthony.joly@hubruxelles.be",
    firstname: "Salim a.",
    lastname: "Joly",
    password: "password",
    password_confirmation: "password",
    service: Service.last,
    groupe: Groupe.last,
    administrator: true,
    manager: true
)

