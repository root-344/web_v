FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    first_name            { gimei.last.kanji } 
    last_name             { gimei.first.kanji }
    first_name_kana       { gimei.last.katakana }
    last_name_kana        { gimei.first.katakana }
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.unique.free_email }
    password              { 'a1' + Faker::Internet.password }

    trait :user_with_posts do
      after(:build) do |user|
      end
    end
  end
end