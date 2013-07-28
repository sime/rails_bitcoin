= Rails Bitcoin Tools

````ruby

class Member < ActiveRecord::Base

  # attributes: address, message, signature

  # check address is valid Bitcoin address
  validates :address, bitcoin_address: true
  
  # check signature is signed by adress and message
  validates :signature, bitcoin_signature: true
  # or 
  validates :signature, bitcoin_signature: { :verify_message => :message_attr, :verify_address => :address_attr }

end

````
