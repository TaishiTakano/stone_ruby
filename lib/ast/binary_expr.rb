# -*- coding: utf-8 -*-
module Ast
  class BinaryExpr < AstList
  
    def initialize(c)
      super(c)
    end

    def left
      return self.child 0
    end

    def operator
      c = self.child 1
      return c.token.get_text
    end
    
    def right
      return self.child 2
    end
  end
end
