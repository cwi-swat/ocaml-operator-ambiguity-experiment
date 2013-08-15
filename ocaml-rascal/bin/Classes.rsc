module Classes

extend Lexical;
extend Names;
extend Typexpr;
extend Expressions;

syntax ClassType 
     = classType: (("?"? LabelName ":")? Typexpr "-\>")* ClassBodyType;

syntax ClassBodyType 
     = classBodyType1: "object" ("(" Typexpr ")")? ClassFieldSpec* "end"
     | classBodyType2: ("[" Typexpr ("," Typexpr)* "]")? ClassPath
     ;

syntax ClassFieldSpec 
     = fieldSpec1: "inherit" ClassType
     | fieldSpec2: "val" "mutable"? "virtual"? InstVarName ":" PolyTypExpr
     | fieldSpec3: "method" "private"? "virtual"? MethodName ":" PolyTypExpr
     | fieldSpec4: "constraint" Typexpr "=" Typexpr
     ;
     
syntax ClassExpr 
     = classPath: ClassPath
	 | classExprBrackets1: "[" Typexpr ("," Typexpr)* "]" ClassPath
	 | classExprBrackets2: "(" ClassExpr ")"
	 | classExprBrackets3: "(" ClassExpr ":" ClassType ")"
	 | classArgs: ClassExpr ! classArgs Arg+
	 | classFun: "fun" Parameter+ "-\>" ClassExpr
	 | letClass: "let" "rec"? LetBinding ("and" LetBinding)* "in" ClassExpr
	 | object: "object" ClassBody "end"
	 ;

syntax ClassField 
     = inheritance: ("inherit" | "inherit!") ClassExpr ("as" ValueName)?
     | classValue: ("val"|"val!") "mutable"? InstVarName (":" Typexpr)? "=" Expr
     | virtualValue: "val" "mutable"? "virtual" InstVarName ":" Typexpr
     | method1: ("method" | "method!") "private"? MethodName Parameter* (":" Typexpr)? "=" Expr
     | method2: "method" "private"? MethodName ":"  PolyTypExpr "=" Expr  
     | method3: "method" "private"? "virtual" MethodName ":" PolyTypExpr
     | classConstraint: "constraint" Typexpr "=" Typexpr
     | classInitializer: "initializer" Expr
     ;
     
syntax ClassDefinition 
	 = classDefinition: "class" {ClassBinding "and"}+;     
     
syntax ClassBody 
	 = classBody: ("(" Pattern (":" Typexpr)? ")")? ClassField*;

syntax ClassBinding 
	 = classBinding: "virtual"? ("[" TypeParameters "]")? ClassName Parameter* (":" ClassType)? "=" ClassExpr;

syntax TypeParameters 
	 = typeParameters: "\'" Ident ("," "\'" Ident)*;
	 
syntax ClassSpecification 
	 = classSpecification: "class" ClassSpec ("and" ClassSpec)*;

syntax ClassSpec 
	 = classSpec: "virtual"? ("[" TypeParameters "]")? ClassName ":" ClassType;

syntax ClassTypeDefinition 
	 = classTypeDefinition: "class" "type" ClasstypeDef ("and" ClasstypeDef)*;

syntax ClasstypeDef 
	 = classTypeDef: "virtual"? ("[" TypeParameters "]")? ClassName "=" ClassBodyType;

     
syntax ExternalDeclaration 
     = externalDecl: StringLiteral1+;	 
