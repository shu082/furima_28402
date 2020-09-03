FactoryBot.define do
  factory :transaction_address do
    post_number   {'123-4567'}
    prefecture_id {'1'}
    city          {'館林市'}
    block         {'新宿二丁目'}
    building_name {'グレースマンション'}
    tel           {'09012345678'}
    price         {'3000'}

  end
end
