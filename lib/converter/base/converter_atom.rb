module Converters
  module ConverterAtom
    VERSION = "atom".freeze

    def self.can_call?(type)
      type == :atom
    end

    def self.convert(hash)
      RSS::Maker.make(VERSION) do |maker|
        maker.channel.updated =  hash[:updated] ? Time.at(hash[:updated]).xmlschema : Time.now
        maker.channel.title = hash[:title] || "unknown"
        maker.channel.id = hash[:id].to_s || "unknown"
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
