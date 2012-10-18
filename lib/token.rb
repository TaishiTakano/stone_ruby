# -*- coding: utf-8 -*-

module Stone
  class Token
    attr_reader :line_number

    def initialize(line_number = 0)
      @line_number = line_number
    end

    @@EOF = self.new(-1)
    @@EOL = "\\n"

    def self.EOF
      @@EOF
    end

    def self.EOL
      @@EOL
    end

    def is_identifier
      return false
    end

    def is_number
      return false
    end

    def is_string
      return false
    end

    def get_number
      raise Exception, "not number"
    end

    def get_text
      ""
    end
  end
end

require './lib/token/num_token'
require './lib/token/str_token'
require './lib/token/id_token'
