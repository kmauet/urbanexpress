require 'rails_helper'

RSpec.feature "Submit a quote" do
  scenario "airport pickup quote" do
    visit '/quote-request'
    click_link 'Airport Pickup'
      fill_in 'airport_pickup_quote_first_name', with: 'Jane'
      fill_in 'airport_pickup_quote_last_name', with: 'Johnson'
      fill_in 'airport_pickup_quote_email', with: 'user@example.com'
    
      click_button 'airport_pickup_quote_submit'
    expect(page).to have_content 'Quote was successfully created'
  end

  scenario "airport dropoff quote" do
    visit '/quote-request'
    click_link 'Airport Dropoff'
      fill_in 'airport_dropoff_quote_first_name', with: 'Jane'
      fill_in 'airport_dropoff_quote_last_name', with: 'Johnson'
      fill_in 'airport_dropoff_quote_email', with: 'user@example.com'
    
      click_button 'airport_dropoff_quote_submit'
    expect(page).to have_content 'Quote was successfully created'
  end

  scenario "Out of Town Charter" do
    visit '/quote-request'
    click_link 'Out of Town Charter'
      fill_in 'out_of_town_quote_first_name', with: 'Jane'
      fill_in 'out_of_town_quote_last_name', with: 'Johnson'
      fill_in 'out_of_town_quote_email', with: 'user@example.com'
    
      click_button 'out_of_town_quote_submit'
    expect(page).to have_content 'Quote was successfully created'
  end

  scenario "Long Term Contracts" do
    visit '/quote-request'
    click_link 'Long Term Contracts'
      fill_in 'contract_quote_first_name', with: 'Jane'
      fill_in 'contract_quote_last_name', with: 'Johnson'
      fill_in 'contract_quote_email', with: 'user@example.com'
    
      click_button 'contract_quote_submit'
    expect(page).to have_content 'Quote was successfully created'
  end

  scenario "Special Events" do
    visit '/quote-request'
    click_link 'Special Events'
      fill_in 'special_event_quote_first_name', with: 'Jane'
      fill_in 'special_event_quote_last_name', with: 'Johnson'
      fill_in 'special_event_quote_email', with: 'user@example.com'
    
      click_button 'special_event_quote_submit'
    expect(page).to have_content 'Quote was successfully created'
  end

  scenario "Contact Us Page" do
    visit '/contact-us'
      fill_in 'contact_us_quote_first_name', with: 'Jane'
      fill_in 'contact_us_quote_last_name', with: 'Johnson'
      fill_in 'contact_us_quote_email', with: 'user@example.com'
    
      click_button 'Send'
    expect(page).to have_content 'Message was successfully sent'
  end

  scenario "Home Page" do
    visit '/'
      fill_in 'contact_us_quote_first_name', with: 'Jane'
      fill_in 'contact_us_quote_last_name', with: 'Johnson'
      fill_in 'contact_us_quote_email', with: 'user@example.com'
    
      click_button 'Send'
    expect(page).to have_content 'Message was successfully sent'
  end

end
