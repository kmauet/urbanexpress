require 'rails_helper'
require 'will_paginate/array' 

RSpec.describe "quotes/index", type: :view do
  before(:each) do
      assign(:qutes, [
      Quote.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone_number => "Phone Number",
        :vehicule_type => "Vehicule Type",
        :num_of_passengers => 2
      ),
      Quote.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone_number => "Phone Number",
        :service_type => "Service Type",
        :num_of_passengers => 2
      )
    ])
    @quotes = Quote.ransack(nil).result(distinct: true).order('updated_at desc').paginate(:page => 1, per_page: 12)
    @q = Quote.ransack(nil)
  end

  it "renders a list of quotes" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
  end
end
