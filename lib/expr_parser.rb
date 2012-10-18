# -*- coding: utf-8 -*-
class NumberLiteral
  def initialize(t)
  end
end

class AstLeaf
  def initialize(t)
  end
end

class AstList
  def initialize(list)
  end
end

class BinaryExpr
  def initialize(c)
  end
end

class ExprParser

  def initialize(p)
    @lexer = p
  end

  def expression
    left = self.term
    while (self.is_token("+") or self.is_token("-"))
      #puts "is_token + or -"
      op = Ast::AstLeaf.new(@lexer.read)
      right = self.term
      left = Ast::BinaryExpr.new(Array.new([left, op, right]))
    end
    #print "expression: "
    #p left
    return left
  end

  def term
    left = self.factor
    while (self.is_token("*") or self.is_token("/"))
      #puts "is_token * or /"
      op = Ast::AstLeaf.new(@lexer.read)
      right = term
      left = Ast::BinaryExpr.new(Array.new([left, op, right]))
    end
    #print "term: "
    #p left
    return left
  end

  def factor
    #print "factor: "
    if is_token("(")
      self.token("(")
      e = self.expression
      self.token(")")
      p e
      return e
    else
      t = @lexer.read
      if t.is_number
        #print "Number："
        n = Ast::NumberLiteral.new(t)
        #p n
        return n
      else
        # 例外処理
      end
    end
  end

  def token(name)
    t = @lexer.read
    if (!(t.is_identifier && name == t.get_text))
      # 例外処理
    end
  end

  def is_token(name)
    t = @lexer.peek 0
    return (t.is_identifier && name == t.get_text) # true / false
  end  
end

require './lib/lexer'
require './lib/token'
require './lib/line_number_reader'
require './lib/astree'
require './lib/ast/ast_leaf'
require './lib/ast/ast_list'
require './lib/ast/number_literal'
require './lib/ast/name'
require './lib/ast/binary_expr'
