require 'rails_helper'

RSpec.describe "invoices/show", type: :view do
  let(:quote) {
      Quote.create({first_name: 'bob', last_name: 'smith', email: 'bob@smith.com'})
  }
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :price => 2,
      :permalink => "Permalink",
      :rate => 235,
      :name => "Name",
      :quote => quote,
      :customer => nil
    ))
  end

  it "renders attributes in <p>" do
    render

    expect(rendered).to match(/235.0/)
  end
end
