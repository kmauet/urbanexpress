FactoryGirl.define do

  factory :user do
    first_name "bob"
    last_name "smith"
    admin true
    sequence(:email) { |n| "testemail_#{n}@test.com"}
    password "mypass"
  end

end