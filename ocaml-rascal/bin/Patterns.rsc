module Patterns

extend Names;
extend Lexical;
extend Typexpr;

syntax Pattern 
	 = constrPattern: Constr Pattern
	 > tagNamePattern: "`" TagName Pattern
	 > right listCons: Pattern "::" Pattern
	 > non-assoc patterns: Pattern "," {Pattern ","}+
	 > left patternBar: Pattern "|" Pattern
	 > patternAs: Pattern "as" ValueName
	 | patternValueName: ValueName
     | anyPattern: "_"
     | patternConstant: Constant
     | patternRange: CharLiteral ".." CharLiteral   // Extensions
     | patternBrackets: "(" Pattern ")"
     | patternTypxprBrackets: "(" Pattern ":" Typexpr ")"
     | "#" TypeconstrName
     | patternRec: "{" Field ("=" Pattern)? (";" Field "=" Pattern)* ";"? "}"
     | patternTuple: "["  {Pattern ";"}+ ";"? "]"
     | patternArray: "[|" {Pattern ";"}+ ";"? "|]"
     | lazyPattern: "lazy" Pattern
     | "(" "module" ModuleName  (":" PackageType)? ")"  
     ;       
         
syntax Constant 
     = posInt: PositiveIntegerLiteral
	 | negInt: NegativeIntegerLiteral
     | floatLiteral: FloatLiteral
     | charLiteral: CharLiteral
     | stringLiteral: StringLiteral1
     | constr: Constr
     | falseConstant: "false"
     | trueConstant: "true"
     | emptyParenthesis: "(" ")"
	 | emptyBrackets:"[" "]"
	 | emptyArray: "[|" "|]"
	 | emptyCurly: "{\<" "\>}"
     | "`" TagName
     | Int32Literal  
	 | Int64Literal  
     | NativeIntLiteral
     ;