module Modifier
  def self.processing(prepared_hash, options)
    return prepared_hash if options.empty?

    modified_hash = prepared_hash
    options.each { |method| modified_hash[:items] = send(method, prepared_hash[:items]) }
    modified_hash
  end

  def self.sort(items)
    items.sort_by { |item| item[:date] }
  end

  def self.reverse(items)
    items.reverse
  end
end
