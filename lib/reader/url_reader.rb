require "open-uri"

module UrlReader
  def self.can_read?(url)
    URI.parse(url).open.status == %w[200 OK]
  end

  def self.read(url)
    URI.parse(url).open.read
  rescue StandardError
    nil
  end
end
