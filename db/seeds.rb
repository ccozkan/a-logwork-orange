AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

user_1 = FactoryBot.create(:user, email: 'clarkkent@superman.com')
user_2 = FactoryBot.create(:user, email: 'brucewayne@batman.com')
user_3 = FactoryBot.create(:user, email: 'peterparker@spiderman.com')

# current week
15.times do
  random_starting_at = Time.current - rand(6).days + rand(100).minutes
  random_ending_at = random_starting_at + rand(20..120).minutes
  random_time_type = [0, 1, 2].sample

  FactoryBot.create(:worklog,
                    user_id: [user_1, user_2, user_3].sample.id,
                    starting_at: random_starting_at,
                    ending_at: random_ending_at,
                    time_type: random_time_type)
end

# current month but not in current week
25.times do
  random_starting_at = Time.current - 7.days - rand(23).days + rand(100).minutes
  random_ending_at = random_starting_at + rand(20..120).minutes
  random_time_type = [0, 1, 2].sample

  FactoryBot.create(:worklog,
                    user_id: [user_1, user_2, user_3].sample.id,
                    starting_at: random_starting_at,
                    ending_at: random_ending_at,
                    time_type: random_time_type)
end

# neither current month or week
35.times do
  random_starting_at = Time.current - 30.days - rand(100).days + rand(100).minutes
  random_ending_at = random_starting_at + rand(20..120).minutes
  random_time_type = [0, 1, 2].sample

  FactoryBot.create(:worklog,
                    user_id: [user_1, user_2, user_3].sample.id,
                    starting_at: random_starting_at,
                    ending_at: random_ending_at,
                    time_type: random_time_type)
end
