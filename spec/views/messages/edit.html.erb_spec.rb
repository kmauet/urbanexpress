require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :body => "MyText",
      :quote => nil
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "textarea#message_body[name=?]", "message[body]"

      assert_select "input#message_quote_id[name=?]", "message[quote_id]"
    end
  end
end
