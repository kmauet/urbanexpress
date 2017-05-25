require 'rails_helper'

RSpec.describe "applicants/edit", type: :view do
  before(:each) do
    @applicant = assign(:applicant, Applicant.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :position => "MyString",
      :note => "MyText"
    ))
  end

  it "renders the edit applicant form" do
    render

    assert_select "form[action=?][method=?]", applicant_path(@applicant), "post" do

      assert_select "input#applicant_first_name[name=?]", "applicant[first_name]"

      assert_select "input#applicant_last_name[name=?]", "applicant[last_name]"

      assert_select "input#applicant_email[name=?]", "applicant[email]"

      assert_select "input#applicant_phone[name=?]", "applicant[phone]"

      assert_select "input#applicant_position[name=?]", "applicant[position]"

      assert_select "textarea#applicant_note[name=?]", "applicant[note]"
    end
  end
end
