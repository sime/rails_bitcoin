class BitcoinSignatureValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless Bitcoin.valid_address?(value)
      default_options = {:verify_message => :message, :verify_address => :address}
      options = default_options.merge(options || {})

      msg = options[:verify_message]
      add = options[:verify_address]

      raise "Not found #{msg} in object" unless record.respond_to? msg
      raise "Not found #{add} in object" unless record.respond_to? add

      msg_val = record.send(msg)
      add_val = record.send(add)

      begin
        key = Bitcoin::Key.recover_compact_signature_to_key(msg_val, value)
        raise if !key || key.addr != add_val
      rescue
        record.errors.add(attribute, :verify, options)
      end
    end
  end
end

