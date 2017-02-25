require 'rails_helper'

RSpec.describe "vehicule_images/edit", type: :view do
  before(:each) do
    @vehicule_image = assign(:vehicule_image, VehiculeImage.create!(
      :vehicule_id => 1,
      :photo => "MyString"
    ))
  end

  it "renders the edit vehicule_image form" do
    render

    assert_select "form[action=?][method=?]", vehicule_image_path(@vehicule_image), "post" do

      assert_select "input#vehicule_image_vehicule_id[name=?]", "vehicule_image[vehicule_id]"

      assert_select "input#vehicule_image_photo[name=?]", "vehicule_image[photo]"
    end
  end
end
