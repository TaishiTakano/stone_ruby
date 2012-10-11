class Token
	
	#定数
	EOF = Token(-1)
	EOL = "\\n"
	
	#ローカル変数
	lineNumber
	
	
	def Token(line)
		lineNumber = line
	end
	protected:Token
	
	def getLineNumber
		lineNumber
	end
	
	def isIdentifier
		puts false
	end
	
	def isNumber
		puts false
	end
	
	def isString
		puts false
	end
	
	def getNumber
		rescue StoneException
		"not number token"
	end
	
	def getText
		puts ""
	end
end
