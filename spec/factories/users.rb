FactoryGirl.define do
  factory :user do
    email      "user@example.com"
    password   "correct_password"
    first_name "First"
    last_name  "Last"
  end
end
