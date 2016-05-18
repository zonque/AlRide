FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :entry do
    entry_type "offer"
    name "John Doe"
    email
    phone "+1 234 5678"
    date Time.now + 1.day
    from "here"
    to   "there"
    seats 3
    notes "Some random remarks by someone"
    locale "en"
    driver false
  end
end
