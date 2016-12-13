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
end
