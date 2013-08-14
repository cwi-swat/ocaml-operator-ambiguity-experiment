module Typexpr

extend Lexical;
extend Names;

syntax Typexpr 
	 = typexprConstr1: Typexpr TypeConstr
	 > non-assoc star: Typexpr "*" {Typexpr !star "*"}+
	 > right (arrow1: Typexpr "-\>" Typexpr
	 |        arrow2: "?"? LabelName ":" Typexpr !arrow1 "-\>" Typexpr)
	 > Typexpr "as" "\'" Ident 
	 > "private" Typexpr
	 | tagg: "\'" Ident
     | "_"
     | typeExprBrackets: "(" Typexpr ")"
     | typexprConstr2: TypeConstr
  	 | typeExprBrackets2: "(" Typexpr ("," Typexpr)+ ")" TypeConstr
  	 | PolymorphicVariantType
  	 | "\<" ".."? "\>"
  	 | typexprAngleBrackets: "\<" {MethodType ";"}+ (";" "..")? "\>"
  	 | typexprHash1: "#" ClassPath
  	 | typexprHash2: Typexpr "#" ClassPath
  	 | "(" {Typexpr ","}+ ")" "#" ClassPath
  	 | "(" "module" PackageType ")"  
     ;

    
syntax PolymorphicVariantType
 	 = "[" "|"? {TagSpec "|"}* "]"
     | "[\>" {TagSpec "|"}* "]"
     | "[\<"  "|"? {TagSpecFull "|"}+ ("\>" ("`" TagName)+ )?  "]"
     ;
       
syntax PolyTypExpr 
	 = polytype1: Typexpr
     | polytype2: ("\'" Ident)+ "." Typexpr
     ;
       
syntax MethodType 
	= methodType: MethodName ":" PolyTypExpr;
       
       
syntax TagSpec
     = "`" TagName ("of" Typexpr)?
	 | Typexpr
	 ;

syntax TagSpecFull 
	 = "`" TagName ("of" Typexpr)? ("&" Typexpr)*
     | Typexpr
     ;
       