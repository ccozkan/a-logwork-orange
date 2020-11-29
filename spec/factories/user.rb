FactoryBot.define do
  factory :user do
    email { 'foo@bar.com' }
    password { '123456' }
  end
end
