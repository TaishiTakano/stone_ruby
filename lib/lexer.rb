# -*- coding: utf-8 -*-

require "strscan"

module Stone
  class Lexer
  
    def initialize(reader = nil)
      @queue = Array.new
      @has_more = true
      @reader = reader
      @patterns = Hash.new
      @patterns[:comment] = /(\s*)(\/\/.*)/
      @patterns[:number]  = /(\s*)([0-9]+)/
      @patterns[:string]  = /(\s*)("(\"|\\|\n|[^"])*\")/
      @patterns[:id]      = /(\s*)([A-Z_a-z][A-Z_a-z0-9]*|==|<=|>=|&&|\|\||=|\+|-|\*|\/)/
    end
  
    def set_reader(reader)
      @reader = reader
    end

    def read
      if self.fill_queue(0)
        @queue.shift
      else
        Token.EOF
      end
    end

    def peek(i)
      if fill_queue i
        return @queue[i]
      else
        return Token.EOF
      end
    end 

    def fill_queue(i)
      while i >= @queue.size
        if @has_more
          self.read_line
        else
          return false
        end
      end
      return true
    end
  
    def read_line
      line = @reader.read_line
      if line == nil
        @has_more = false
        return
      end
      line.chomp! 
    
      string_scanner = StringScanner.new(line)
      flag = false
    
      until string_scanner.eos?
        # マッチしないと無限ループに
        @patterns.each do |key, value|
          if item = string_scanner.scan(value)
            item.strip!
            self.add_token(@reader.line_number, item, key)
            break
          end
        end
      end
      @queue << IdToken.new(@reader.line_number, Token.EOL)
    end

    def add_token(line_number, match_data, key)
      token = nil
      case key
        when :number
          token = NumToken.new(line_number, match_data.to_i)
        when :string
          token = StrToken.new(line_number, match_data.to_s)
        when :id
          token = IdToken.new(line_number, match_data)
      end
      @queue << token unless token == nil
    end
  end
end
