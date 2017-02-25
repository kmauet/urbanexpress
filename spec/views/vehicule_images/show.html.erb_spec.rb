require 'rails_helper'

RSpec.describe "vehicule_images/show", type: :view do
  before(:each) do
    @vehicule_image = assign(:vehicule_image, VehiculeImage.create!(
      :vehicule_id => 2,
      :photo => "Photo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Photo/)
  end
end
