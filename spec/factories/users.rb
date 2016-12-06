FactoryGirl.define do
  factory :user do
    email     "user@example.com"
    password  "correct_password"
    admin     false

  # This will use the User class (Admin would have been guessed)
    factory :admin do
      email "admin@example.com"
      admin true

      # user_with_posts will create post data after the user has been created
      factory :admin_with_events do
        transient do
          events_count 1
        end

        after(:create) do |admin, evaluator|
          create_list(:event, evaluator.events_count, user: admin)
        end
      end
    end
  end
end