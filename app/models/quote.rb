class Quote < ApplicationRecord
  has_many: :messages, dependent: :destroy
end
