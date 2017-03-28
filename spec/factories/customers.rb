FactoryGirl.define do

  factory :customer do
    first_name "mike"
    last_name "james"
    sequence(:email) { |n| "testcustomeremail_#{n}@test.com"}
    password "mypass"
  end

end