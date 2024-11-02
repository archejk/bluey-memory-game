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
  { name: "Bluey", image_url: "https://res.cloudinary.com/your-cloud-name/image/upload/bluey.jpg" },
  { name: "Bingo", image_url: "https://res.cloudinary.com/your-cloud-name/image/upload/bingo.jpg" },
  { name: "Muffin", image_url: "https://res.cloudinary.com/your-cloud-name/image/upload/muffin.jpg" },
  { name: "Socks", image_url: "https://res.cloudinary.com/your-cloud-name/image/upload/socks.jpg" },
  { name: "Bandit (Dad)", image_url: "https://res.cloudinary.com/your-cloud-name/image/upload/bandit.jpg" },
  { name: "Chilli (Mum)", image_url: "https://res.cloudinary.com/your-cloud-name/image/upload/chilli.jpg" },
  { name: "Coco", image_url: "https://res.cloudinary.com/your-cloud-name/image/upload/coco.jpg" },
  { name: "Snickers", image_url: "https://res.cloudinary.com/your-cloud-name/image/upload/snickers.jpg" },
  { name: "Lucky", image_url: "https://res.cloudinary.com/your-cloud-name/image/upload/lucky.jpg" },
  { name: "Indy", image_url: "https://res.cloudinary.com/your-cloud-name/image/upload/indy.jpg" }
])

# run the seed commands later if cloudinary images are uploaded to the cloud
# rails db:seed
