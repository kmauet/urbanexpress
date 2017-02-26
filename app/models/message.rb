class Message < ApplicationRecord
  belongs_to :quote
  belongs_to :user
  belongs_to :customer

  serialize :email_hash, Hash
  serialize :to, Array 
  serialize :from, Hash
  serialize :cc, Array 
  serialize :attachments, Array 
  serialize :headers, Hash 

end
