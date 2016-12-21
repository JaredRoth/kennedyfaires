FactoryGirl.define do
  factory :business do
    sequence :business_name do |n|
      "Business #{n}"
    end
    product_description "Best product"
    street_address "Place"
    city "City"
    state "State"
    zip "12345"
  end
end
