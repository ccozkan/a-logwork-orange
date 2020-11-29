AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

user_1 = FactoryBot.create(:user, email: 'clarkkent@superman.com')
user_2 = FactoryBot.create(:user, email: 'brucewayne@batman.com')
user_3 = FactoryBot.create(:user, email: 'peterparker@spiderman.com')

42.times do
  random_starting_at = Time.current - rand(7).days - rand(77)
  random_ending_at = random_starting_at + rand(120).minutes
  random_time_type = [0, 1, 2].sample

  FactoryBot.create(:worklog,
                    user_id: [user_1, user_2, user_3].sample.id,
                    starting_at: random_starting_at,
                    ending_at: random_ending_at,
                    time_type: random_time_type)
end
