FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.email }
    password              { "#{Faker::Internet.password(min_length: 6, mix_case: false)}1a" }
    password_confirmation { password }
    last_name             { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    kana_last_name        { Gimei.last.katakana }
    kana_first_name       { Gimei.first.katakana }
    date_of_birth         { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
