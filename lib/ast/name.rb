# -*- coding: utf-8 -*-
module Ast
  class Name < AstLeaf
  
    def initialize(t)
      super(t)
    end
    
    def name
      return Token.new.get_text
    end 
  end
end
