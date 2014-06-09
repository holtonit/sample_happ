FactoryGirl.define do
  factory :user do
    name                  "Hannes Holton"
    email                 "hannes@example.com"
    password              "foobar"
    password_confirmation "foobar"
  end
end