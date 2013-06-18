module OCaml

extend Lexical;
extend Expressions;
extend ModuleExpressions;
extend ModuleTypes;
     		
   	 
start syntax Interface = specifications: (Specification ";;"?)*; 
    	 
start syntax Implementation = definitions: (Definition ";;"?)*;

start syntax TopLevel = toplevels: TopLevelPhrase*
			          | toplevels1: TopLevelPhrase* Expr
			          | toplevels2: TopLevelPhrase* Definition
			          ;

syntax TopLevelPhrase 
	 = topLevelDefinitions: Definition+ ";;"
   	 | expr: Expr ";;"
   	 ;     		
 