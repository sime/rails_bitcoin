class BitcoinAddressValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless Bitcoin.valid_address?(value)
      record.errors.add(attribute, :invalid, options)
    end
  end
end
