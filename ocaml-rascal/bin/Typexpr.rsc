module Typexpr

extend Lexical;
extend Names;
extend Extensions;


syntax Typexpr 
	 = typexprConstr1: Typexpr TypeConstr
	 > non-assoc star: Typexpr "*" {Typexpr !star "*"}+
	 > right (arrow1: Typexpr "-\>" Typexpr
	 |        arrow2: "?"? LabelName ":" Typexpr !arrow1 "-\>" Typexpr)
	 > typexprAsId: Typexpr "as" "\'" Ident 
	 > typexprPrivate: "private" Typexpr
	 | tagg: "\'" Ident
     | anyTypexpr: "_"
     | typeExprBrackets: "(" Typexpr ")"
     | typexprConstr2: TypeConstr
  	 | typeExprBrackets2: "(" Typexpr ("," Typexpr)+ ")" TypeConstr
  	 | polymorphicVariantType: PolymorphicVariantType
  	 | typexprEmptyAngleBrackets: "\<" ".."? "\>"
  	 | typexprAngleBrackets: "\<" {MethodType ";"}+ (";" "..")? "\>"
  	 | typexprHash1: "#" ClassPath
  	 | typexprHash2: Typexpr "#" ClassPath
  	 | typexprHash3: "(" {Typexpr ","}+ ")" "#" ClassPath
  	 | typexprPackage: "(" "module" PackageType ")"  
     ;

    
syntax PolymorphicVariantType
 	 = polymorphicVariantType1: "[" "|"? {TagSpec "|"}* "]"
     | polymorphicVariantType2: "[\>" {TagSpec "|"}* "]"
     | polymorphicVariantType3: "[\<"  "|"? {TagSpecFull "|"}+ ("\>" ("`" TagName)+ )?  "]"
     ;
       
syntax PolyTypExpr 
	 = polytype1: Typexpr
     | polytype2: ("\'" Ident)+ "." Typexpr
     ;
       
syntax MethodType 
	= methodType: MethodName ":" PolyTypExpr;
       
       
syntax TagSpec
     = tagSpec1: "`" TagName ("of" Typexpr)?
	 | tagSpec2: Typexpr
	 ;

syntax TagSpecFull 
	 = tagSpecFull1: "`" TagName ("of" Typexpr)? ("&" Typexpr)*
     | tagSpecFull2: Typexpr
     ;
       