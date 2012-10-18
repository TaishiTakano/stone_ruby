# -*- coding: utf-8 -*-
module Stone
  class LineNumberReader
    attr_reader :text
    attr_accessor :line_number

    def initialize(text)
      @text = Array.new
      text.each_line do |line|
        @text.push line
      end
      @line_number = 0
    end

    def mark
    end

    def read
    end

    def read_line
      line = @text[@line_number]
      @line_number += 1
      return line
    end

    def ready
    end

    def reset
    end

    def skip
    end
  end
end
