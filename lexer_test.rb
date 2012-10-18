require './lib/line_number_reader'
require './lib/lexer'
require './lib/token'

text = "13 + x * 2"

reader = Stone::LineNumberReader.new(text)
lexer  = Stone::Lexer.new(reader)

token = true

i = 0

while token != Stone::Token.EOF
  token = lexer.read
  print "token[#{i}] => "
  p token.get_text
  i += 1
end
