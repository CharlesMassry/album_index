FactoryGirl.define do
  factory :song do
    association :album
    title 'I Knew You Were Trouble'
  end
end
