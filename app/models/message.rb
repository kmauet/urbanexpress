class Message < ApplicationRecord
  belongs_to :quote
  belongs_to :user
  belongs_to :customer

  serialize :email_hash, Hash
end
