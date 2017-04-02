class InvoicePolicy < ApplicationPolicy
  attr_reader :user, :invoice

  def initialize(user, invoice)
    @user = user
    @invoice = invoice
  end

  def create?
    user.admin? or (invoice.quote != nil and invoice.quote.user_id == user.id)
  end
  def edit?
    user.admin? or (invoice.quote != nil and invoice.quote.user_id == user.id)
  end
  def update?
    user.admin? or (invoice.quote != nil and invoice.quote.user_id == user.id)
  end
  def destroy?
    user.admin? or (invoice.quote != nil and invoice.quote.user_id == user.id)
  end
end