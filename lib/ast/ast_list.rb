# -*- coding: utf-8 -*-
module Ast
  class AstList < ASTree
  
    def initialize(list)
      @children = list   
    end

    def child(i)
      return @children[i]
    end
    
    def num_children
      return @children.size
    end
    
    def children
      return @children.clear
    end
    
    def to_string
      builder = "("
      sep = "";
      
　　　@children.each do |t|
        builder << sep
        sep = " "
        builder << t.to_s
      end

      builder << ")"
      return builder.to_s 
    end

    def location
      @children.each do |t|
        s = t.location
        if s != nil then return s end
      end
      return nil
    end
  end
end
