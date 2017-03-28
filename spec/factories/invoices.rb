FactoryGirl.define do

  factory :invoice do
    sequence(:permalink) { |n| "permalink_#{n}"}
    sequence(:name) { |n| "name #{n}"}
    price 5
    association :quote, factory: :quote
    association :customer, factory: :customer
    association :sales_rep, factory: :user
  end

end