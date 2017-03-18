require 'rails_helper'

RSpec.describe "invoices/index", type: :view do
  let(:quote) {
      Quote.create({first_name: 'bob', last_name: 'smith', email: 'bob@smith.com'})
  }
  before(:each) do
    assign(:invoices, [
      Invoice.create!(
        :price => 2,
        :permalink => "first-invoice",
        :name => "first invoice",
        :first_name => "jim",
        :last_name => "smith",
        :rate => 234,
        :quote => quote,
        :customer => nil
      ),
      Invoice.create!(
        :price => 2,
        :permalink => "second-invoice",
        :name => "second invoice",
        :first_name => "jim",
        :last_name => "smith",
        :rate => 234,
        :quote => quote,
        :customer => nil
      )
    ])
  end

  it "renders a list of invoices" do
    render

    assert_select "tr>td", :text => 234.0.to_s, :count => 2
  end
end
