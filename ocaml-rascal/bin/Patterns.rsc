module Patterns

extend Names;
extend Lexical;
extend Typexpr;

syntax Pattern 
	 = constrPattern: 		  Constr Pattern
	 > tagNamePattern: 		  "`" TagName Pattern
	 > right listCons: 		  Pattern "::" Pattern
	 > non-assoc patterns: 	  Pattern "," {Pattern !patterns !patternBar !patternAs ","}+
	 > left patternBar: 	  Pattern "|" Pattern
	 > patternAs: 			  Pattern "as" ValueName
	 | patternValueName: 	  ValueName
     | anyPattern: 			  "_"
     | patternConstant: 	  Constant
     | patternRange: 		  CharLiteral ".." CharLiteral   // Extensions
     | patternBrackets: 	  "(" Pattern ")"
     | patternTypxprBrackets: "(" Pattern ":" Typexpr ")"
     | patternHash: 		  "#" TypeconstrName
     | patternRec: 			  "{" Field ("=" Pattern)? (";" Field "=" Pattern)* ";"? "}"
     | patternTuple: 		  "["  {Pattern ";"}+ ";"? "]"
     | patternArray: 		  "[|" {Pattern ";"}+ ";"? "|]"
     | lazyPattern: 		  "lazy" Pattern
     | patternPackage: 		  "(" "module" ModuleName  (":" PackageType)? ")"  
     ;       
         
syntax Constant 
     = posInt: 			PositiveIntegerLiteral
	 | negInt:		 	NegativeIntegerLiteral
     | floatLiteral: 	FloatLiteral
     | charLiteral: 	CharLiteral
     | stringLiteral: 	StringLiteral1
     | constr: 			Constr
     | falseConstant: 	"false"
     | trueConstant: 	"true"
     | emptyParenthesis: "(" ")"
	 | emptyBrackets:	"[" "]"
	 | emptyArray: 		"[|" "|]"
	 | emptyCurly: 		"{\<" "\>}"
     | "`" TagName
     | int32: 			Int32Literal  
	 | int64: 			Int64Literal  
     | nativeInt: 		NativeIntLiteral
     ;