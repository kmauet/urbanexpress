require 'rails_helper'

RSpec.describe "vehicule_images/index", type: :view do
  before(:each) do
    assign(:vehicule_images, [
      VehiculeImage.create!(
        :vehicule_id => 2,
        :photo => "Photo"
      ),
      VehiculeImage.create!(
        :vehicule_id => 2,
        :photo => "Photo"
      )
    ])
  end

  it "renders a list of vehicule_images" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
  end
end
