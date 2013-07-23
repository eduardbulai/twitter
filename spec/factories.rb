FactoryGirl.define do
  factory :user do
    name     "Captain Morgan"
    email    "Captain@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end