module Converters
  module ConverterRss
    VERSION = "2.0".freeze

    def self.can_call?(type)
      type == :rss
    end

    def self.convert(hash)
      RSS::Maker.make(VERSION) do |maker|
        maker.channel.title = hash[:title] || "unknown"
        maker.channel.link = hash[:link] || "unknown"
        maker.channel.description = hash[:description]

        hash[:items].each do |entry|
          maker.items.new_item do |item|
            item.link = entry[:link]
            item.title = entry[:title]
            item.description = entry[:description]
            item.pubDate = Time.at(entry[:date]).rfc2822
          end
        end
      end
    end
  end
end
