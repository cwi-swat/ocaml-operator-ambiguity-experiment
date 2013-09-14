module ModuleTypes 	

extend Lexical;
extend Classes;
extend Names;
extend TypeAndExceptions;
 	
syntax Specification 
	 = specificationVal: "val" ValueName ":" Typexpr
     | external: 		 "external" ValueName ":" Typexpr "=" ExternalDeclaration
     | typeDef: 		 TypeDefinition
     | exceptionDef:	 ExceptionDefinition
     | classSpec: 		 ClassSpecification
     | classDef: 		 ClassDefinition
     | classTypeDef: 	 ClassTypeDefinition
     | moduleDef1: 		 "module" ModuleName ( "(" ModuleName ":" ModuleType ")" )* ( ":" ModuleType )? "=" ModuleExpr
     | moduleDef2: 		 "module" ModuleName ("(" ModuleName ":" ModuleType ")")* ":" ModuleType
     | modType1: 		 "module" "type" ModTypeName "=" ModuleType
     | modType2: 		 "module" "type" ModTypeName
     | open: 			 "open" ModulePath
     | includeSpec: 	 "include" ModuleType
     ;
     
     
syntax ModuleType 
     = modTypePath: ModTypePath
     | sig: "sig" ( Specification ";;"? )* "end"
     | modTypeOf: "module" "type" "of" ModuleExpr
     | modTypeWith: ModuleType "with" ModConstraint ("and" ModConstraint)*
     > functor: "functor" "(" ModuleName ":" ModuleType ")" "-\>" ModuleType
     | bracketModType1: "(" ModuleType ")"
     | bracketModType2: ModuleType "(" ModuleType ")"
     ;


syntax ModConstraint 
	 = modConsType1: "type" TypeParams? TypeConstr "=" Typexpr
	 | modConsType2: "type" TypeParameters?  TypeconstrName ":="  TypeParameters?  TypeConstr
     | modeConsModule1: "module" ModulePath "=" ExtendedModulePath
 	 | modeConsModule2: "module" ModuleName ":="  ExtendedModulePath  
     ; 	