stone_ruby
==========

New programming language.  
「2週間でできる！スクリプト言語の作り方」をRubyで実装する試み（志半ば）  

最終更新日  
2012年10月18日

使い方
-------------
### ブラウザで実行してみたい人 ###
` % gem install sinatra`  
` % ruby stone.rb`

→ <a href="http://localhost:4567">http://localhost:4567</a> へアクセス  

テキストエリアに適当にコードを入力して、OKボタンを押す。

### sinatra入れるのがめんどくさい人 ###

`% ruby debug.rb`  

→ コマンドラインからテキストを入力できます。  
※ 「Q」と入力してエンターで入力終了。 

テストコード  
------------
+ lexer_test.rb : 字句解析器のテストコード
+ expr_parser_test.rb : 構文解析のテストコード

