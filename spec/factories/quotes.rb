FactoryGirl.define do

  factory :quote do
    first_name "bob"
    last_name "smith"
    email "test@test.com"
    #user FactoryGirl.create(:user)
  end

end