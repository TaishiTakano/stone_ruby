package chap3
import stone.*

class LexerRunner
	l = new Lexer(new CodeDialog())
	for t in t = l.read() != Token.EOF
	print "=>" + t.getText()	
end