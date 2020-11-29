FactoryBot.define do
  random_starting_at = Time.current - rand(7).days - rand(77)
  random_ending_at = random_starting_at + rand(120).minutes
  random_time_type = [0, 1, 2].sample

  factory :worklog do
    user { nil }
    remark { nil }
    time_type { random_time_type }
    starting_at { random_starting_at }
    ending_at { random_ending_at }
  end
end
