module TypeAndExceptions

extend Lexical;
extend Names;
extend Typexpr;
extend Expressions;
extend Extensions;
extend ModuleExpressions;
extend ModuleTypes;


syntax TypeDefinition 
     = typeDefinition: "type" {TypeDef "and"}+;
     
syntax TypeDef 
     = typeDef: TypeParams? TypeconstrName TypeInformation;

syntax TypeInformation 
     = typeInformation: TypeEquation? TypeRepresentation? TypeConstraint*;

syntax TypeEquation 
     = typeEquation: "=" Typexpr
     ;
          
syntax TypeRepresentation 
 	= constrDecls: "=" "private"? "|"? {ConstrDecl "|"}+
    | fieldDecls: "=" "private"? "{" {FieldDecl ";"}+ ";"? "}"
    ;

syntax TypeParams 
     = singleTypeParam: TypeParam
     | typeParamList: "(" {TypeParam ","}+ ")"
     ;

syntax TypeParam 
     = typeParam1: Variance? "\'" Ident
     | typeParam2: Variance? "_"
     ;     
     
syntax Variance 
     = posVariance: "+" 
     | negVariance: "-";
     
syntax ConstrDecl 
     = constDecl1: ConstrName ("of" { Typexpr !star "*"}+)?
     | constDecl2: ConstrName ":" { Typexpr !star "*" }+ "-\>"  Typexpr
     ;

syntax FieldDecl 
	 = fieldDecl: "mutable"? FieldName ":" PolyTypExpr
	 ;


syntax TypeConstraint 
	 = typeConstraint: "constraint" "\'" Ident "=" Typexpr;
     
syntax ExceptionDefinition 
	 = exception1: "exception" ConstrName ("of" Typexpr !star ("*" Typexpr)* )?
     | exception2: "exception" ConstrName "=" Constr
     ;
