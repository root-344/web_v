FactoryBot.define do
  factory :post do
    team_name   { "Teすト" }
    genre_id    {2}
    date        {"2021/12/11 10:00"}
    content     { "testtesttest"}

    # アソシエーション
    user
    trait :user_with_users do
      after(:build) do |post|
      end
    end

  end
end
