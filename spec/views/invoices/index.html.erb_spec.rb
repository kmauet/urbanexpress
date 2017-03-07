require 'rails_helper'

RSpec.describe "invoices/index", type: :view do
  before(:each) do
    assign(:invoices, [
      Invoice.create!(
        :price => 2,
        :permalink => "Permalink",
        :name => "Name",
        :quote => nil,
        :customer => nil
      ),
      Invoice.create!(
        :price => 2,
        :permalink => "Permalink",
        :name => "Name",
        :quote => nil,
        :customer => nil
      )
    ])
  end

  it "renders a list of invoices" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Permalink".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
