require 'rails_helper'

RSpec.describe "invoices/show", type: :view do
  let(:quote) {
      Quote.create({first_name: 'bob', last_name: 'smith', email: 'bob@smith.com'})
  }
  let(:customer) {
      Customer.create({first_name: 'bob', last_name: 'smith', email: 'customer@smith.com'})
  }
  let(:user) {
      User.create({first_name: 'tim', last_name: 'tom', email: 'sales_rep@email.com'})
  }
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :price => 2,
      :permalink => "Permalink",
      :rate => 235,
      :name => "Name",
      :quote => quote,
      :sales_rep => user,
      :customer => customer
    ))
  end

  it "renders attributes in <p>" do
    render

    expect(rendered).to match(/235.0/)
  end
end
