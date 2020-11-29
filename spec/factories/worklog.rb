FactoryBot.define do

  factory :worklog do
    user { nil }
    remark { nil }
    time_type { random_time_type }
    starting_at { random_starting_at }
    ending_at { random_ending_at }
  end
end
