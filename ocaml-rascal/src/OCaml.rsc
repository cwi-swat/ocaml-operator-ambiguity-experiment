module OCaml

extend Lexical;
extend Expressions;
extend ModuleExpressions;
extend ModuleTypes;
     		
   	 
start syntax Interface = specifications: (Specification ";;"?)*; 
    	 
start syntax Implementation = definitions: (Definition ";;"?)*;

start syntax TopLevel = toplevels: TopLevelPhrase* (Expr | Definition)?;

syntax TopLevelPhrase 
	 = topLevelDefinitions: Definition+ ";;"
   	 | expr: Expr ";;"
   	 ;     		
 