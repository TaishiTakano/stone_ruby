# -*- coding: utf-8 -*-
module Ast
  class NumberLiteral < AstLeaf
  
    def initialize(t)
      super(t)
    end
    
    def value
      return token.new.get_number
    end
  end
end
