FactoryGirl.define do
  factory :vendor do
    sequence :email do |n|
      "vendor#{n}@example.com"
    end
    password   "correct_password"
    first_name "First"
    last_name  "Last"
  end
end
