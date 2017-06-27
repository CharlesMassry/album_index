FactoryGirl.define do
  factory :album do
    title 'Red'
    association :artist
  end
end
