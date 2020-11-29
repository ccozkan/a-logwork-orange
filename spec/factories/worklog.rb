FactoryBot.define do
  factory :worklog do
    user { nil }
    remark { nil }
    time_type { 1 }
    starting_at { Time.current - 2.hours }
    ending_at { Time.current - 45.minutes }
  end
end
