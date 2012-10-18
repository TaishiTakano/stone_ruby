require 'sinatra'
require './lib/line_number_reader'
require './lib/lexer'
require './lib/token'
require './lib/expr_parser'

if development?
  require 'sinatra/reloader'
end

get '/' do
  erb :index
end

post '/result' do
  text = params[:text]
  reader = Stone::LineNumberReader.new(text)
  lexer  = Stone::Lexer.new(reader)
  
  token = true
  tokens = Array.new

  while token != Stone::Token.EOF
    token = lexer.read
    tokens.push(token.get_text)
  end
 
  

  text = params[:text]
  reader = Stone::LineNumberReader.new(text)
  lexer  = Stone::Lexer.new(reader)

 
  parser = ExprParser.new(lexer)
  tree = parser.expression

  erb :result, :locals => {:tokens => tokens, :tree => tree}
end
