require "pundit/rspec"
require 'rails_helper'

describe InvoicePolicy do
  subject { described_class.new(user, invoice) }

  let(:user) { FactoryGirl.create(:user) }

  context 'user is different from corresponding quote sales_rep' do
    context 'user is admin' do
      let(:quote) { FactoryGirl.create(:quote) }
      let(:invoice) { FactoryGirl.create(:invoice, quote_id: quote.id ) }

      it { is_expected.to permit_action(:create) }
    end
  end
end

describe InvoicePolicy do
  subject { described_class.new(user, invoice) }

  let(:user) { FactoryGirl.create(:user, admin: false) }

  context 'user is same as corresponding quote sales_rep' do
    let(:quote) { FactoryGirl.create(:quote, user_id: user.id) }
    let(:invoice) { FactoryGirl.create(:invoice, quote_id: quote.id ) }

    it { is_expected.to permit_actions([:create, :edit, :destroy, :update]) }
  end

  context 'user is different from corresponding quote sales_rep' do
    context 'user is not admin' do
      let(:quote) { FactoryGirl.create(:quote) }
      let(:invoice) { FactoryGirl.create(:invoice, quote_id: quote.id ) }

      it { is_expected.to forbid_actions([:create, :edit, :destroy, :update]) }
    end
  end
end
