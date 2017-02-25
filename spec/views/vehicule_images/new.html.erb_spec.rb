require 'rails_helper'

RSpec.describe "vehicule_images/new", type: :view do
  before(:each) do
    assign(:vehicule_image, VehiculeImage.new(
      :vehicule_id => 1,
      :photo => "MyString"
    ))
  end

  it "renders new vehicule_image form" do
    render

    assert_select "form[action=?][method=?]", vehicule_images_path, "post" do

      assert_select "input#vehicule_image_vehicule_id[name=?]", "vehicule_image[vehicule_id]"

      assert_select "input#vehicule_image_photo[name=?]", "vehicule_image[photo]"
    end
  end
end
