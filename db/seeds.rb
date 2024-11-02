# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Card.create([
  { name: 'Bluey', image_url: 'https://res.cloudinary.com/your_cloud_name/image/upload/v1234567890/bluey.png' },
  { name: 'Bingo', image_url: 'https://res.cloudinary.com/your_cloud_name/image/upload/v1234567890/bingo.png' },
  { name: 'Bandit', image_url: 'https://res.cloudinary.com/your_cloud_name/image/upload/v1234567890/bandit.png' },
  { name: 'Chilli', image_url: 'https://res.cloudinary.com/your_cloud_name/image/upload/v1234567890/chilli.png' }
])

# run the seed commands later if cloudinary images are uploaded to the cloud
# rails db:seed
