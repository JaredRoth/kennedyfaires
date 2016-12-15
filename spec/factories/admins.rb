FactoryGirl.define do
  factory :admin do
    sequence :email do |n|
      "admin#{n}@example.com"
    end
    password   "correct_password"
    first_name "First"
    last_name  "Last"

    # user_with_posts will create post data after the user has been created
    factory :admin_with_faires do
      transient do
        faires_count 1
      end

      after(:create) do |this_admin, evaluator|
        create_list(:faire, evaluator.faires_count, admin: this_admin)
      end
    end

    factory :admin_with_events do
      transient do
        faires_count 1
      end

      after(:create) do |this_admin, evaluator|
        create_list(:faire_with_events, evaluator.faires_count, admin: this_admin)
      end
    end
  end
end
