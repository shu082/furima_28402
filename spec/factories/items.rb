FactoryBot.define do
  factory :item do
    name                      {"redbull"}
    description               {"翼を授ける"}
    category_id               {"2"}
    status_id                 {"2"}
    delivery_charge_id        {"2"}
    delivery_source_id        {"2"}
    delivery_day_id          {"2"}
    price                     {"3000"}
    association :user
  end
end
