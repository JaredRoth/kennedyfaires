FactoryGirl.define do
  factory :vendor do
    sequence :email do |n|
      "vendor#{n}@example.com"
    end
    password   "correct_password"
    first_name "First"
    last_name  "Last"

    factory :vendor_with_businesses do
      transient do
        businesses_count 1
      end

      after(:create) do |this_vendor, evaluator|
        create_list(:business, evaluator.businesses_count, vendor: this_vendor)
      end
    end

  end
end
