module ModuleExpressions

extend Lexical;
extend TypeAndExceptions;
extend Classes;
extend Names;

syntax Definition 
	 = defVal: "val" ValueName ":" Typexpr
	 | letDef: "let" "rec"? LetBinding  ("and" LetBinding)*
     | external: "external" ValueName ":" Typexpr "=" ExternalDeclaration
     | typeDef: TypeDefinition
     | exceptionDef: ExceptionDefinition
     | classDef:ClassDefinition
     | classTypeDef: ClassTypeDefinition
     | moduleDef1: "module" ModuleName ( "(" ModuleName ":" ModuleType ")" )* ( ":" ModuleType )? "=" ModuleExpr
     | moduleDef2: "module" ModuleName ("(" ModuleName ":" ModuleType ")")* ":" ModuleType
     | modType1: "module" "type" ModTypeName "=" ModuleType
     | modType2: "module" "type" ModTypeName
     | modRec1: "module" "rec" ModuleName ":"  ModuleType "="  ModuleExpr  ("and" ModuleName ":"  ModuleType "="  ModuleExpr)*
     | modRec2: "module" "rec" ModuleName ":"  ModuleType  ("and" ModuleName ":"  ModuleType)*
     | open: "open" ModulePath
     | include: "include" ModuleExpr
     ;
     
     
syntax ModuleExpr 
     = modExpModPath: ModulePath
     | struct1: "struct" ((Definition+ ";;") | (Expr ";;"))* "end"
     | struct2: "struct" Definition+ "end"
     | Expr (";;" Expr)* ";;"? (Definition (";;" Expr)* ";;"?)* "end"
     | functor: "functor" "(" ModuleName ":" ModuleType ")" "-\>" ModuleExpr
     | modApp: ModuleExpr "(" ModuleExpr ")"
     | modExprBrackets: "(" ModuleExpr ")"
     | moduleExprType: "(" ModuleExpr ":" ModuleType ")"
     | moduleExprVal: "(" "val" Expr  (":" PackageType)? ")" 
     ;      
     