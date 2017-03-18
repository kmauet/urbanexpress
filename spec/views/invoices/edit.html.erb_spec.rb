require 'rails_helper'

RSpec.describe "invoices/edit", type: :view do
  let(:quote) {
      Quote.create({first_name: 'bob', last_name: 'smith', email: 'bob@smith.com'})
  }
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :price => 1,
      :permalink => "MyString",
      :name => "MyString",
      :first_name => "bobby",
      :last_name => "smith",
      :quote => quote,
      :customer => nil
    ))
  end

  it "renders the edit invoice form" do
    render

    assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do

      assert_select "input#invoice_first_name[name=?]", "invoice[first_name]"

      assert_select "input#invoice_last_name[name=?]", "invoice[last_name]"
    end
  end
end
