FactoryGirl.define do
  factory :city do
    sequence :name, [ 'Carlsbad',
                      'Encinitas',
                      'Escondido',
                      'Fallbrook',
                      'Oceanside',
                      'Vista',
                      'San Marcos'].cycle do |name|
      name
    end
  end

  factory :event do
    date        Date.today
    year        Date.today.year
    sequence :season, ['Fall', 'Spring'].cycle do |season|
      season
    end
    title       "Street Faire"
    description "Stop it, stop it. This objectification of women has to stop. It's just Mom and whores. Well, obviously, I'm not a big guy. I'm not a Carl Weathers, par example. These are my awards, Mother. From Army. The seal is for marksmanship, and the gorilla is for sand racing. I think the only time you cooked for us was the morning Rosa's mom died. You gave us cereal in an ashtray. Could it be love? I know what an erection feels like, Michael. No, it's the opposite. It's like my heart is getting hard."
    city
    admin
  end

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
