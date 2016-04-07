me = User.new({
  username: "heath",
  email: "heath@heath.com",
  password: "password"
  })

kathryn = User.new({
  username: "kathryn",
  email: "kathryn@kathryn.com",
  password: "password"
  })

me.save
kathryn.save

me_too = Recipient.create({
  name: "heather",
  foot_length: 9.0,
  foot_circumference: 8.5
  })

my_socks = Project.create({
  knitter_id: 1,
  recipient_id: 1,
  project_name: "ribbed socks",
  yarn_name: "Sockalicious",
  yarn_type: "90% superwash wool, 10% nylon",
  needle_size: "US2",
  swatch_width: 5.25,
  swatch_height: 4.125,
  swatch_stitch_count: 40,
  swatch_row_count: 42
})

pattern = Pattern.create({
  project_id: 1,
  cast_on: 28,
  toe_increase_stitches: 30,
  gusset_increase_stitches: 22,
  number_of_heel_stitches: 24
  })

5.times do 
  random_number = rand(5.0..12.0).round(2)
  Recipient.create({
    name: Faker::Name.first_name,
    foot_length: random_number,
    foot_circumference: random_number * 0.9
  })
end

10.times do
  random_dimensions = rand(3.0..6.0).round(3)
  random_counts = rand(30..50)

  Project.create({
    knitter_id: [1,2].sample,
    recipient_id: rand(1..6),
    project_name: "ribbed socks",
    yarn_name: "Sockalicious",
    yarn_type: "90% superwash wool, 10% nylon",
    needle_size: "US2",
    swatch_width: random_dimensions,
    swatch_height: random_dimensions * 0.8,
    swatch_stitch_count: random_counts,
    swatch_row_count: random_counts * 1.05
  })
end