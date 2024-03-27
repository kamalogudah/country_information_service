# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
countries = Country.create([
    {name: "Algeria", alpha_2_code: "DZ", alpha_3_code: "DZA", currency: "DZD"},
    {name: "Angola", alpha_2_code: "AO", alpha_3_code: "AGO", currency: "AOA"},
    {name: "Egypt", alpha_2_code: "EG", alpha_3_code: "EGY", currency: "EGP"},
    {name: "Kenya", alpha_2_code: "KE", alpha_3_code: "KEN", currency: "KES"},
    {name: "South Africa", alpha_2_code: "ZA", alpha_3_code: "ZAF", currency: "ZAR"}
  ])

