User.create!(username: "mk", email: "mk@test.com", password: "password")

9.times do
  username = Faker::Internet.user_name
  email = Faker::Internet.safe_email(username)
  User.create!(username: username, email: email, password: "password")
end

def fake_start_time(earliest_date = Date.current.beginning_of_day, latest_date = earliest_date.advance(days: 14).end_of_day)
  local_date = Faker::Time.between(earliest_date, latest_date)
  utc_date = local_date.utc
  utc_date.change(hour: [11, 12, 13, 14].sample, min: [0, 15, 30, 45].sample)
end


5.times do
people = rand(1..10)

  @potluck_old = Potluck.create!(name: Faker::Coffee.blend_name, location: Faker::Address.community, host_id: people, starts_at: fake_start_time(14.days.ago.beginning_of_day, 2.days.ago.end_of_day))

  2.times do
    p_people = rand(1..10)
    @potluck_old.potluck_attendances <<  PotluckAttendance.create!(dish: Faker::Food.dish, user_id: p_people, potluck_id: @potluck_old.id)
  end

  @potluck_now = Potluck.create!(name: Faker::Coffee.blend_name, location: Faker::Address.community, host_id: people, starts_at: fake_start_time(Date.current.beginning_of_day, Date.current.end_of_day))

  2.times do
    p_people = rand(1..10)
    @potluck_now.potluck_attendances <<  PotluckAttendance.create!(dish: Faker::Food.dish, user_id: p_people, potluck_id: @potluck_now.id)
  end

  @potluck_future = Potluck.create!(name: Faker::Coffee.blend_name, location: Faker::Address.community, host_id: people, starts_at: fake_start_time(2.days.from_now.beginning_of_day))

  2.times do
    p_people = rand(1..10)
    @potluck_future.potluck_attendances <<  PotluckAttendance.create!(dish: Faker::Food.dish, user_id: p_people, potluck_id: @potluck_future.id)
  end
end

