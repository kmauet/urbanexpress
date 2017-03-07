class Invoice < ApplicationRecord
  include Payola::Sellable
  belongs_to :quote
  belongs_to :customer
end
