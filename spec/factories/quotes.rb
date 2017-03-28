FactoryGirl.define do

  factory :quote do
    first_name "bob"
    last_name "smith"
    email "test@test.com"
    association  :user, factory: :user
  end

end