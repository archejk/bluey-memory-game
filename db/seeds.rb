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
  { name: "Bluey", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545322/bluey_pgehjn.png" },
  { name: "Bingo", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545322/bingo_jzmwbo.png" },
  { name: "Muffin", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545322/muffin_lne3ju.png" },
  { name: "Socks", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545323/socks_ugmurk.png" },
  { name: "Bandit (Dad)", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545322/bandit_seckkh.png" },
  { name: "Chilli (Mum)", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545323/chilli_ztbtxz.png" },
  { name: "Nana", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545325/nana_qs0jnq.png" },
  { name: "Jack", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545325/jack_ag0wwp.png" },
  { name: "Granny Rita", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545322/granny-rita_o8dpfl.png" },
  { name: "Judo", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545325/judo_gjwni7.png" }
])

# run the seed commands later if cloudinary images are uploaded to the cloud
# rails db:seed
