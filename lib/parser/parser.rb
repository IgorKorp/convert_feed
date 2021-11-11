require_relative "./base/base"

module Parsers
  class Parser
    include Parsers::Base

    def initialize(data)
      @data = data
    end

    def parser
      parse(@data)
    end
  end
end
