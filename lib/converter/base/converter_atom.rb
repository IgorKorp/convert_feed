module Converters
  module ConverterAtom
    VERSION = "atom".freeze

    def self.can_call?(type)
      type == :atom
    end

    def self.convert(hash)
      RSS::Maker.make(VERSION) do |maker|
        maker.channel.updated = hash[:update] || Time.now
        maker.channel.title = hash[:title] || "unknown"
        maker.channel.id = hash[:id] || "unknown"
        maker.channel.author = hash[:author] || "unknown"

        hash[:items].each do |item|
          maker.items.new_item do |entry|
            entry.link = item[:link]
            entry.title = item[:title]
            entry.updated = Time.at(item[:date]).xmlschema
            entry.summary = item[:description]
          end
        end
      end
    end
  end
end
