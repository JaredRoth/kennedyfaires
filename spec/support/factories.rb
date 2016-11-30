FactoryGirl.define do
  factory :admin do
    email     "admin@example.com"
    password  "correct_password"

    factory :admin_with_events do
      transient do
        events_count 1
      end
      after(:create) do |admin, evaluator|
        create_list(:event, evaluator.events_count, admin: admin)
      end
    end
  end
end
