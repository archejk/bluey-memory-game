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
  { name: "Judo", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545325/judo_gjwni7.png" },
  { name: "Bently", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545325/bentley_jbz5kt.png" },
  { name: "Chucky", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545325/chucky_gtltie.png" },
  { name: "Buddy", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545325/buddy_rltult.png" },
  { name: "Chloe", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545325/chloe_iwm6lb.png" },
  { name: "Coco", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545325/coco_qunp6c.png" },
  { name: "Dougie", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545325/dougie_mxwnw3.png" },
  { name: "Dusty", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545325/dusty_zcqu7h.png" },
  { name: "Fido", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545325/fido_sfbt3e.png" },
  { name: "Doreen", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545325/doreen_tfffib.png" },
  { name: "Digger", image_url: "https://res.cloudinary.com/dngtno2ra/image/upload/v1730545325/digger_u2nvbo.png" }
])

# run the seed commands later if cloudinary images are uploaded to the cloud
# rails db:seed
