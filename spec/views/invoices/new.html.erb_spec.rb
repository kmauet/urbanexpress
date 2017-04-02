  require 'rails_helper'

RSpec.describe "invoices/new", type: :view do
  before(:each) do
    assign(:invoice, Invoice.new(
      :price => 1,
      :permalink => "new-perma",
      :name => "New name",
      :sales_rep => User.create({first_name: 'tim', last_name: 'tom', email: 'sales_rep@email.com'}),
      :quote => Quote.create({first_name: "jon", last_name: "jacob", email: "test@jacob.com", first_name: "jack", last_name: "hansen"}),
      :customer => Customer.create({first_name: 'bob', last_name: 'smith', email: 'customer@smith.com'})
    ))
  end

  it "renders new invoice form" do
    render

    assert_select "form[action=?][method=?]", invoices_path, "post" do

      assert_select "input#invoice_price[name=?]", "invoice[price]"

      assert_select "input#invoice_permalink[name=?]", "invoice[permalink]"

      assert_select "input#invoice_name[name=?]", "invoice[name]"

      assert_select "input#invoice_quote_id[name=?]", "invoice[quote_id]"

      assert_select "select#invoice_customer_id[name=?]", "invoice[customer_id]"
    end
  end
end
