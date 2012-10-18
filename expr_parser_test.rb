# encoding: utf-8

require './lib/line_number_reader'
require './lib/lexer'
require './lib/token'
require './lib/expr_parser'

text = "13 + x * 2"

reader = Stone::LineNumberReader.new(text)
lexer  = Stone::Lexer.new(reader)

# token = true
# tokens = Array.new

#while token != Stone::Token.EOF
#  token = lexer.read
#  tokens.push(token.get_text)
#end

parser = ExprParser.new(lexer)
t = parser.expression
print "=>"
p t
