require 'rails_helper'

RSpec.describe "quotes/new", type: :view do
  before(:each) do
    assign(:quote, Quote.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone_number => "MyString",
      :service_type => "MyString",
      :vehicule_type => "MyString",
      :number_of_people => 1
    ))
  end

  it "renders new quote form" do
    render

    assert_select "form[action=?][method=?]", quotes_path, "post" do

      assert_select "input#quote_first_name[name=?]", "quote[first_name]"

      assert_select "input#quote_last_name[name=?]", "quote[last_name]"

      assert_select "input#quote_email[name=?]", "quote[email]"

      assert_select "input#quote_phone_number[name=?]", "quote[phone_number]"

      assert_select "input#quote_service_type[name=?]", "quote[service_type]"

      assert_select "input#quote_vehicule_type[name=?]", "quote[vehicule_type]"

      assert_select "input#quote_number_of_people[name=?]", "quote[number_of_people]"
    end
  end
end
