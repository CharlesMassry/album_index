FactoryGirl.define do
  factory :song do
    association :album
    title 'I Knew You Were Trouble'
    duration 351
  end
end
