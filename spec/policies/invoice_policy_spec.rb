
require 'rails_helper'

describe InvoicePolicy do
  subject { described_class.new(user, invoice) }

  let(:quote) { FactoryGirl.create(:quote) }
  let(:invoice) { FactoryGirl.create(:invoice, quote: quote) }

  context 'being a visitor' do
    let(:user) { nil }

    it { is_expected.to forbid_action(:create) }
  end

  context 'being an administrator' do
    let(:user) { FactoryGirl.create(:user)}

    it { is_expected.to permit_actions([:destroy]) }
  end
end