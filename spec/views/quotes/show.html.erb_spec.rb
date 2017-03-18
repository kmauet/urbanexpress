require 'rails_helper'

RSpec.describe "quotes/show", type: :view do
  before(:each) do
    @quote = assign(:quote, Quote.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :phone_number => "Phone Number",
      :service_type => "Service Type",
      :vehicule_type => "Vehicule Type",
      :num_of_passengers => 2,
      :messages => []
    ))
    @messages = []
    @message = Message.new
  end

  it "renders attributes in <div>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/2/)
  end
end
