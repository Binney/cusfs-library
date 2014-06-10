FactoryGirl.define do
  factory :item do
    sequence(:title)  { |n| "A History of the Roman Empire: Volume #{n}" }
    sequence(:author) { |n| "Frank N Furter #{n}th" }
    sequence(:date)   { |n| (1961+n) }
    medium "Book"
  end

  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
  end

end