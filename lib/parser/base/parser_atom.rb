module Parsers
  module ParserAtom
    def self.can_call?(type)
      type == "atom"
    end

    def self.parse(xml)
      hash = {
        old_format: "atom",
        title: xml.title.content,
        id: xml.id.content,
        updated: xml.updated.content.to_i,
        author: xml.author.name.content,
        description: xml.subtitle&.content || "none",
        items: []
      }

      xml.entries.each do |entry|
        hash[:items] << {
          title: entry.title.content,
          date: entry.updated.content.to_i,
          description: entry.summary.content,
          id: entry.id.content,
          link: entry.link.href
        }
      end
      hash
    end
  end
end
