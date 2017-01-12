FactoryGirl.define do
  factory :event do
    sequence :date do |n|
      Date.today + n
    end
  end
end
