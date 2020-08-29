
SOURCES = $(wildcard */*.java)
CLASSES = $(SOURCES:.java=.class) parser/Lexer.class parser/sym.class parser/Parser.class

default: parser/Lexer.java parser/Parser.java $(CLASSES)

parser/Lexer.java: parser/Scanner.jflex
	cd parser && $(JFLEX_DIR)/bin/jflex --nobak Scanner.jflex

parser/Parser.java: parser/Parser.cup
	cd parser && java -jar $(CUP_DIR)/java-cup-11b.jar -interface -parser Parser Parser.cup

%.class: %.java
	javac --release 7 -cp $(CUP_DIR)/java-cup-11b.jar:. $<

clean:
	rm -f */*.class parser/Lexer.java parser/sym.java parser/Parser.java

submission: clean
	rm -f myproject.tgz
	tar czf myproject.tgz *
