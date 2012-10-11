require "fcntl"
require "open3"
require 'scanf'


class Lexer
	
	$regexPad = "\\s*((//.*)|([0-9]+)|(\"(\\\\\"|\\\\\\\\|\\\\n|[^\"])*\")" + "|[A-Z_a-z][A-Z_a-z0-9]*|==|<=|>=|&&|\\|\\||\\p{Punct})?"
	
	@pattern = Pattern.compile(regexPad)
	
	@pueue = ArrayList(Token)
	
	@hasMore
	
	@reader
	
	def Lexer(r)
		@hasMore = true;
		@reader = LineNumberReader(r)
	end
	
	def read()
		if fillQueue(0)
			@pueue.remove(0)
			else
			Token.EOF
		end
	end
	
	def peek(i)
		if fillQueue(i)
			@pueue.get(i)
			else
			Token.EOF
		end
	end
	
	def fillQueue(i)
		while i >= @pueue.size()
			if @hasMore
				readLine()
				else
				false
			end
			true
		end
	end
	private:fillQueue
	
	def readLine()
		line
		begin
			line = @reader.readLine()
			rescue
			new PaeseException()
		end
		if line == null
			@hasMore = false
		end
		lineNo = @reader.getLineNumber()
		matcher = @pattern.matchier(line)
		matcher.useTransparentBounds(true).useAnchoringBounds(false)
		pos = 0
		endPos = line.length()
		while pos < endPos
			matcher.region(pos,endPos)
			if matcher.LoolingAt()
				addToken(lineNo,matcher)
				pos = matcher.end()
				else
				new ParseException("bad token at line " + lineNo)
			end
		end
		@pueue.add(IdToken(lineNo,Token.EOL))
	end
	protected:readLine
	
	def addToken(lineNo,matcher)
		m = matcher.group(1)
		if m != null
			if matcher.group(2) == null
				token
				if matcher.group(3) != null
					token = NumToken(lineNo,Integer.paeseInt(m))
					else matcher.group(4) != null
					token = StrToken(lineNo,toStringLiteral(m))
					else
					token = IdToken(lineNo,m)
					@pueue.add(token)
				end
			end
		end
	end
	protected:addToken
	
	def toStringLiteral(s)
		sb = StringBuilder
		len = s.length() - 1
		for i in 1..len
			c = s.charAt(i)
			if c == '\\' && i + 1 < len
				c2 = s.charAt(++i)
				else c2 == 'n'
				++i
				c = '\n'
			end
			sb.append(c)
		end
		sb.toString()
	end
	protected:toStringLiteral
	
	def NumToken(line,v)
		@value
		super(line)
		@value = v
		def isNumber()
			true
		end
		def getText()
			Integer.toString(value)
		end
		def getNumber()
			value
		end
	end
	protected:NumToken
	
	
	def IdToken(line,id)
		@text
		super(line)
		@text = id
		def isIdentifier()
			true
		end
		def getText()
			text
		end
	end
	protected:IdToken
	
	def StrToken(line,str)
		@literal
		super(line)
		@literal = str
		def isString()
			true
		end
		def getText()
			literal
		end
	end
	protected:StrToken
	
end







