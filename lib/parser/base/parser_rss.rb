module Parsers
  module ParserRss
    def self.can_call?(type)
      type == "rss"
    end

    def self.parse(data)
      hash = {
        old_format: "rss",
        title: data.channel.title,
        description: data.channel.description,
        link: data.channel.link,
        items: []
      }

      data.channel.items.each do |item|
        hash[:items] << {
          title: item.title,
          date: item.pubDate.to_i,
          description: item.description,
          link: item.link,
          id: item.guid.content
        }
      end
      hash
    end
  end
end
