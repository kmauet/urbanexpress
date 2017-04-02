require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers

describe 'Accessing invoice page' do
  let!(:customer) { create(:customer, email: 'customer@example.com',  password: 'mypassword') }
  context 'an invoice has been created for customer' do
    before do
      login_as(customer, scope: :customer)
      visit '/unpaid-customer-invoices'
    end
    it 'contains the word invoice' do
      expect(page).to have_content 'Invoices Due'
    end
  end
end



  