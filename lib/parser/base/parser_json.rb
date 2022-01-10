require "date"

module Parsers
  module ParserJson
    def self.can_call?(type)
      type == "json"
    end

    def self.parse(object)
      hash = {
        old_format: "json",
        title: object.title,
        id: object.id,
        updated: DateTime.parse(object.updated).to_time.to_i,
        author: object.author,
        description: object.description || "none",
        items: []
      }

      object.items.each do |entry|
        hash[:items] << {
          title: entry.title,
          date: DateTime.parse(entry.updated).to_time.to_i,
          description: entry.description,
          id: entry.id,
          link: entry.link
        }
      end

      hash
    end
  end
end
