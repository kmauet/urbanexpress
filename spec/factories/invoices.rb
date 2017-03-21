FactoryGirl.define do

  factory :invoice do
    sequence(:permalink) { |n| "permalink_#{n}"}
    sequence(:name) { |n| "name #{n}"}
    price 5
    quote Quote.new
  end

end