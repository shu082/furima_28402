FactoryBot.define do
  factory :user do
    nick_name             {Faker::Name.name}
    first_name            {"田中"}
    last_name             {"太郎"}
    katakana_first_name    {"タナカ"}
    katakana_last_name     {"タロウ"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {"1997-1-1"}
  end
end
