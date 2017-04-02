require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe WebPageController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Invoice. As you add validations to Invoice, be sure to
  # adjust the attributes here as well.
  let(:user) {
    FactoryGirl.create(:user)
  }
  let(:customer) {
    FactoryGirl.create(:customer)
  }
  let(:quote) {
    #make sure user can manage the invoice (pundit authorization)
    FactoryGirl.create(:quote, user_id: user.id)
  }
  let(:customer) {
    FactoryGirl.create(:customer)
  }
  let(:valid_attributes) {
    {first_name: 'bob', last_name: 'smith', email: 'bob@smith.com', name: "first invoice", permalink: "first-invoice", 
      price: "40", quote_id: quote.id, user_id: user.id, customer_id: customer.id}
  }

  let(:invalid_attributes) {
    {first_name: 'bob', last_name: 'smith', name: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InvoicesController. Be sure to keep this updated too.
  #let(:valid_session) { {} }

  before do
    sign_in customer
  end

  describe "GET #show_unpaid_customer_invoices" do
    it "only assigns customer's own unpaid invoices as @invoices" do
      invoice = FactoryGirl.create(:invoice, customer_id: customer.id)
      second_invoice = FactoryGirl.create(:invoice, customer_id: customer.id, accepted: true)
      someone_elses_invoice = FactoryGirl.create(:invoice)
      get :show_unpaid_customer_invoices
      expect(assigns(:invoices)).to eq([invoice, second_invoice])
    end

    it "doesn't include payed invoices as @invoices" do
      invoice = FactoryGirl.create(:invoice, customer_id: customer.id, payed: nil)
      second_invoice = FactoryGirl.create(:invoice, customer_id: customer.id, payed: true)
      get :show_unpaid_customer_invoices
      expect(assigns(:invoices)).to eq([invoice])
    end
  end

  describe "PATCH #submit_accepted_invoice" do
    it "it marks invoice as submitted" do
      invoice = FactoryGirl.create(:invoice, customer_id: customer.id)
      other_invoice = FactoryGirl.create(:invoice)
      patch :submit_accepted_invoice, params: {id: invoice.to_param, invoice: {id: invoice.id, accepted: true}}
      expect(assigns(:invoice).accepted).to eq(true)
    end
  end

  describe "PATCH #show_unpaid_customer_invoice" do
    it "it assigns invoice with that id to @invoice if unpaid" do
      unpaid_invoice = FactoryGirl.create(:invoice, customer_id: customer.id, payed: nil)
      get :show_unpaid_customer_invoice, params: {id: unpaid_invoice.to_param}
      expect(assigns(:invoice)).to eq(unpaid_invoice)
    end

    it "it doesn't assign invoice with that id to @invoice if paid" do
      paid_invoice = FactoryGirl.create(:invoice, customer_id: customer.id, payed: true)
      get :show_unpaid_customer_invoice, params: {id: paid_invoice.to_param}
      expect(assigns(:invoice)).to eq(nil)
    end

    it "it doesn't assign invoice with that id to @invoice if invoice doesn't belong to customer" do
      other_invoice = FactoryGirl.create(:invoice)
      get :show_unpaid_customer_invoice, params: {id: other_invoice.to_param}
      expect(assigns(:invoice)).to eq(nil)
    end
  end
  
  
end
