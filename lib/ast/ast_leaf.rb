# -*- coding: utf-8 -*-
module Ast
  class AstLeaf < ASTree
    attr_reader :token  

    def initialize(t)
      @empty = Array.new
      @token = t
    end

    def child(i)
      return  
    end

    def num_children
      return 0
    end

    def children
      return Array.new
    end

    def to_string
      return @token.get_text
    end

    def location
      return "at line" + @token.line_number
    end
  end
end

require './lib/token'
