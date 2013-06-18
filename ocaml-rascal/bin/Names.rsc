module Names

extend Lexical;

syntax ValuePath 
	 = valuePath: (ModulePath ".")? ValueName;

syntax ValueName 
	= LowercaseIdentifier 
	| "(" OperatorChar+ !>> [! : \< = \> ? @ ^ | ~] ")"   // This is added to cover cases such as let (!) x y = x + y
	| "(" ("mod"| "lsl" | "lsr" | "asr" | "mod" | "land" | "lor" | "lxor") ")" 
	;   

syntax TagName = Ident;

syntax TypeconstrName = LowercaseIdentifier;

syntax TypeConstr = typeConstr: (ExtendedModulePath ".")? TypeconstrName;

syntax ConstrName = CapitalizedIdentifier;

syntax LabelName = LowercaseIdentifier;

syntax ModuleName = CapitalizedIdentifier;

syntax FieldName = LowercaseIdentifier;

syntax ClassName = LowercaseIdentifier;

syntax InstVarName = LowercaseIdentifier;

syntax MethodName = LowercaseIdentifier;

syntax ModTypeName = Ident;

syntax ModulePath = modulePath: (ModuleName ".")* ModuleName;

syntax Constr = const: (ModulePath ".")? ConstrName;

syntax Field = field_name: FieldName
             | path_field_name: ModulePath "." FieldName;

syntax ClassPath = classPath: (ModulePath "." )? ClassName;

syntax ModTypePath = modTypePath: (ExtendedModulePath "." )? ModTypName;

syntax ModTypName = Ident;

syntax ExtendedModulePath = extendedModulePath1: (ExtendedModulePath ".")? ModuleName
                          | extendedModulePath2: ExtendedModulePath "(" ExtendedModulePath ")";


