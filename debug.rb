require './lib/line_number_reader'
require './lib/lexer'
require './lib/token'

text = ""

while true
  print ">>"
  s = gets
  if s.chomp == "Q" then break end
  text += s
end

reader = Stone::LineNumberReader.new(text)
lexer  = Stone::Lexer.new(reader)

token = true

while token != Stone::Token.EOF
  token = lexer.read
  print "token => "
  p token.get_text
end
