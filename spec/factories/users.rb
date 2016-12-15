FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password   "correct_password"
    first_name "First"
    last_name  "Last"
  end
end
