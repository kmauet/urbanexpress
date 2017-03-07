require 'rails_helper'

RSpec.describe "invoices/new", type: :view do
  before(:each) do
    assign(:invoice, Invoice.new(
      :price => 1,
      :permalink => "MyString",
      :name => "MyString",
      :quote => nil,
      :customer => nil
    ))
  end

  it "renders new invoice form" do
    render

    assert_select "form[action=?][method=?]", invoices_path, "post" do

      assert_select "input#invoice_price[name=?]", "invoice[price]"

      assert_select "input#invoice_permalink[name=?]", "invoice[permalink]"

      assert_select "input#invoice_name[name=?]", "invoice[name]"

      assert_select "input#invoice_quote_id[name=?]", "invoice[quote_id]"

      assert_select "input#invoice_customer_id[name=?]", "invoice[customer_id]"
    end
  end
end
