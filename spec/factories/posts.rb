FactoryBot.define do
  factory :post do
    team_name   { "Teすト" }
    genre_id    {2}
    date        {"2021/12/11 10:00"}
    content     { "testtesttest"}
    association :user
  end
end
