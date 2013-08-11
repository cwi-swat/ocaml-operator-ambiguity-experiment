module Expressions

extend Lexical;
extend Names;
extend Typexpr;
extend Patterns;
extend Extensions;

syntax Expr 
	 = prefix: PrefixSymbol Expr
	 > field: Expr "." Field  
	 | dotBracket1: Expr ".(" Expr ")"
	 | dotBracket2: Expr ".[" Expr "]"
	 | dotBracket3: Expr ".{" Expr "}"
	 > hash: Expr "#" MethodName
     > non-assoc (functionApplication: Expr !semicolon Arg+
     | constrExp: Constr Expr
     | polyVariant: "`" TagName Expr  
     | lazy: "lazy" Expr
     | assertExpr: "assert" Expr)
     > unaryMinus: "-" !>> [0-9] Expr | floatUnaryMinus: "-." Expr
     > right infix1: Expr InfixSymbol1 Expr
     > left  infix2: Expr InfixSymbol2 Expr
     > left  infix3: Expr InfixSymbol3 Expr
     > right coloncolon: Expr "::" Expr
     > right infix4: Expr InfixSymbol4 Expr
     > left  infix5: Expr InfixSymbol5 Expr
     | left  uneq:   Expr "!=" Expr
     > right infix6: Expr InfixSymbol6 Expr
     > right infix7: Expr InfixSymbol7 Expr
     > non-assoc comma: Expr ("," Expr)+
     > right (assign1: Expr "." Field "\<-" Expr
     | assign2: Expr ".(" Expr ")" "\<-" Expr
     | assign3: Expr ".[" Expr "]" "\<-" Expr
     | assign4: Expr ".{" Expr "}" "\<-" Expr
     | assign5: InstVarName "\<-" Expr)
     > right infix8: Expr InfixSymbol8 Expr
     > ifThenElse: "if" Expr "then" Expr "else" Expr
     | ifThen: "if" Expr "then" Expr !>> (Layout "else")
     > semicolon: Expr ";" !>>  ";"
     > right sep: Expr ";" Expr
     > match: "match" Expr "with" PatternMatching
     | function: "function" PatternMatching
     | fun: "fun" MultipleMatching
     | tryBlock: "try" Expr "with" PatternMatching     
     | letbinding: "let" "rec"? {LetBinding "and"}+ "in" Expr
     | letModule: "let" "module" ModuleName "="  ModuleExpr "in"  Expr 
     | brackets: "(" Expr ")"
  	 | beginEnd: "begin" Expr "end"
  	 | brackets1: "(" Expr ":" Typexpr ")"
  	 | brackets2: "(" Expr ":\>"  Typexpr ")"  
 	 | brackets3: "(" Expr ":"  Typexpr ":\>"  Typexpr ")"  
 	 | brackets4: "{\<" InstVarName "=" Expr !semicolon !sep  (";" InstVarName "="  Expr)*  ";"? "\>}"  
  	 | tupl: "["  {Expr !sep !semicolon ";"}+ ";"? "]"
     | array: "[|" {Expr !sep !semicolon ";"}+ ";"? "|]"
     | record1: "{" Field ("=" Expr !semicolon !sep)? (";" Field ("=" Expr !semicolon !sep)?)* ";"? "}"
     | record2: "{" Expr "with" Field ("=" Expr !semicolon !sep )? (";" Field ("=" Expr !semicolon !sep)?)* ";"? "}"
     | whileloop: "while" Expr "do" Expr "done"
     | forloop: "for" Ident "=" Expr ("to" | "downto") Expr "do" Expr "done"
     | new: "new" ClassPath
     | object: "object" ClassBody "end"  
     | "(" "module" ModuleExpr  (":" PackageType)? ")"  
     | valuePath: ValuePath
	 | constant: Constant
     ; 
     
syntax Arg 
 	 = Expr !unaryMinus !floatUnaryMinus !letbinding !ifThenElse !ifThen !match !function !fun !tryBock !letModule
 	 | Label
     | LabelColon Expr !unaryMinus !floatUnaryMinus !letbinding !ifThenElse !ifThen !match !function !fun !tryBock !letModule
     | OptLabel
     | OptLabelColon Expr !unaryMinus !floatUnaryMinus !letbinding !ifThenElse !ifThen !match !function !fun !tryBock !letModule 
     ;
           
syntax PatternMatching 
     = patternMatching: "|"? Pattern ("when" Expr)? "-\>" Expr InnerPatternMatching* !>> (Layout "|") 
     ;
     
syntax InnerPatternMatching
	 = innerPatternMatching: "|" Pattern ("when" Expr)? "-\>" Expr
	 ;     
           
syntax LetBinding 
	 = letBinding: Pattern Parameter* (":" Typexpr)? "=" Expr
	 //| ValueName ":"  PolyTypExpr "="  Expr
	 | ValueName ":" "type"  TypeConstr* "."  Typexpr "="  Expr 
	 ;
	 
	 
syntax MultipleMatching
     = multipleMatching: Parameter+ ("when" Expr)? "-\>" Expr;	 

syntax Parameter 
	 = Pattern
     | "~" LabelName !>> ":"
     | "~" "(" LabelName (":" Typexpr)? ")"
     | "~" LabelName ":" Pattern
     | "?" LabelName !>> ":"
     | "?" "(" LabelName (":" Typexpr)? ("=" Expr)? ")"
     | "?" LabelName ":" Pattern
     | "?" LabelName ":" "(" Pattern (":" Typexpr)? ("=" Expr)? ")"
     | "(" "type" TypeconstrName ")"  
     ;
     


