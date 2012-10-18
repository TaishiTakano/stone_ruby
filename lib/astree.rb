# -*- coding: utf-8 -*-
module Ast
  class ASTree
    
    def initialize()
      @children = Array.new
      @location = ""
    end
    
    def child(i)
      # i番目の子を返す
    end

    def num_children
      # 子の個数を返す
    end

    def children
      # すべての子を順に数え上げるためのIteratorオブジェクトを返す
    end

    def location
      # その抽象構文木の節のプログラム内での位置を表す文字列を返す
    end

    def iterator
      # childrenメソッドと同じ。ASTreeクラスをIterable型にするためのアダプタ
      @children
    end

  end
end

require './lib/ast/ast_leaf.rb'
require './lib/ast/ast_list.rb'
require './lib/ast/number_literal.rb'
require './lib/ast/name.rb'
require './lib/ast/binary_expr.rb'
