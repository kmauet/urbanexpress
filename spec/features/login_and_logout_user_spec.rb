require 'rails_helper'

RSpec.feature "Signing in for user" do
  let!(:user) { create(:user, email: 'user@example.com',  password: 'mypassword') }

  scenario "Signing in for user with correct credentials" do
    visit '/users/sign_in'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'mypassword'
    
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end


  scenario "Signing in for user with wrong credentials" do
    visit '/users/sign_in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: "dssfasfafasfaf"
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end

RSpec.feature "Signing in for customer" do
  let!(:customer) { create(:customer, email: 'customer@example.com',  password: 'mypassword') }

  scenario "Signing in for customer with correct credentials" do
    visit '/customers/sign_in'
      fill_in 'Email', with: 'customer@example.com'
      fill_in 'Password', with: 'mypassword'
    
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end


  scenario "Signing in for customer with wrong credentials" do
    visit '/customers/sign_in'
      fill_in 'Email', with: customer.email
      fill_in 'Password', with: "sdgfhdhdhdh"
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end

