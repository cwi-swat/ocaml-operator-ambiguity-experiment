module Lexical

lexical Ident = LowercaseIdentifier | CapitalizedIdentifier; 

// underscore is considered a lower case identifier
lexical LowercaseIdentifier = ([a-zA-Z_0-9] !<< [a-z_] [A-Za-z0-9_\']* !>> [A-Za-z0-9_\']) \ Keywords;

lexical CapitalizedIdentifier = ([a-zA-Z_0-9] !<< [A-Z] [A-Za-z0-9_\']* !>> [A-Za-z0-9_\']) \ Keywords;

lexical IntegerLiteral1 = [\-]? [0-9] [0-9_]* !>> [0-9_.eE];

lexical Int32Literal = SpecialInt [l];  
 
lexical Int64Literal = SpecialInt [L];  
 
lexical NativeIntLiteral =	SpecialInt [n];

lexical SpecialInt = [\-]? [0-9] [0-9_]* !>> [0-9_.eE]
				   | [\-]? ("0x"| "0X") [0-9A-Fa-f][0-9A-Fa-f_]* !>> [0-9_A-Fa-f.eE]  
				   | [\-]? ("0o"| "0O") [0-7] [0-7_]* !>> [0-7.eE]
				   | [\-]? ("0b"| "0B") [0-1] [0-1_]* !>> [0-7.eE]
				   ;

lexical PositiveIntegerLiteral = [0-9] [0-9_]* !>> [0-9_.eElLn]
							   | ("0x"| "0X") [0-9A-Fa-f][0-9A-Fa-f_]* !>> [0-9_A-Fa-f.eElLn]  
 							   | ("0o"| "0O") [0-7] [0-7_]* !>> [0-7.eElLn]
 							   | ("0b"| "0B") [0-1] [0-1_]* !>> [0-7.eElLn]
 							   ;

lexical NegativeIntegerLiteral = [\-] PositiveIntegerLiteral;

lexical FloatLiteral =  [\-]? [0-9] [0-9_]* [eE] [+\-]? [0-9] [0-9_]* !>> [0-9.eE\-]                  // only with .
				     |  [\-]? [0-9] [0-9_]* [.] [0-9][0-9_]* !>> [0-9.eE\-]                           // only with e
                     |  [\-]? [0-9] [0-9_]* [.] [0-9][0-9_]* [eE] [+\-]? [0-9] [0-9_]* !>> [0-9.eE\-] // with both . and e
					 ;
					 
lexical CharLiteral = [\'] (RegularChar | EscapeSequence) [\'];
                            
lexical EscapeSequence = ([\\] [\\ \" \' n t b r])
	                   | ([\\] [0-9][0-9][0-9])
	                   | ([\\][x] [0-9A-Fa-f][0-9A-Fa-f]);
                            
lexical StringLiteral1 = [\"] StringCharacter* [\"];

lexical StringCharacter = RegularCharStr |  EscapeSequence | [\\][\n] | [\\][\ ];

lexical RegularChar = ![\'\\];

lexical RegularCharStr = ![\"\\];

lexical OperatorChar = [! $ % & * + \- . / : \< = \> ? @ ^ | ~];

lexical PrefixSymbol = [!] OperatorChar* !>> [! $ % & * + \- . / : \< = \> ? @ ^ | ~]
   	                 | [? ~] OperatorChar+  !>> [! $ % & * + \- . / : \< = \> ? @ ^ | ~]
	                 ;

lexical Label =	"~" LowercaseIdentifier !>> ":";                 
lexical LabelColon =	"~" LowercaseIdentifier ":";
lexical OptLabel = "?" LowercaseIdentifier !>> ":";
lexical OptLabelColon = "?" LowercaseIdentifier ":";	                 

lexical InfixSymbol1 = "lsl" !>> [a-z] | "lsr" !>> [a-z] | "asr" !>> [a-z] | ([*][*] OperatorChar* !>> [! $ % & * + \- . / : \< = \> ? @ ^ | ~]) \ InfixSymbol1Exclude;
lexical InfixSymbol2 = "mod" !>> [a-z] | "land" !>> [a-z]| "lor" !>> [a-z] | "lxor" !>> [a-z] | ([/ % *] OperatorChar* !>> [! $ % & * + \- . / : \< = \> ? @ ^ | ~]) \ InfixSymbol2Exclude; 
lexical InfixSymbol3 = ([+ \-] OperatorChar* !>> [! $ % & * + \- . / : \< = \> ? @ ^ | ~]) \ InfixSymbol3Exclude;
lexical InfixSymbol4 = [@ ^] OperatorChar* !>> [! $ % & * + \- . / : \< = \> ? @ ^ | ~];
lexical InfixSymbol5 = ([= \< \> | & $] OperatorChar* !>> [! $ % & * + \- . / : \< = \> ? @ ^ | ~]) \ InfixSymbol5Exclude;
lexical InfixSymbol6 =  "&" | "&&";                      
lexical InfixSymbol7 =  "||" | "or" !>> [a-z];
lexical InfixSymbol8 =  ":=";

keyword InfixSymbol1Exclude = ")";
keyword InfixSymbol2Exclude = "**";
keyword InfixSymbol3Exclude = "-\>";
keyword InfixSymbol5Exclude = "|" | "||" | "&&" | "&" | "\<-";

keyword Keywords = "_" |
        "and"|       "as"|           "assert"|      "asr"|           "begin"|    
        "class"|     "constraint"|   "do"|          "done"|          "downto"|   
        "else"|      "end"|          "exception"|   "external"|      "false"|    
        "for"|       "fun"|          "function"|    "functor"|       "if"|       
        "in"|        "include"|      "inherit"|     "initializer"|   "land"|     
        "lazy"|      "let"|          "lor"|         "lsl"|           "lsr"|     
        "lxor"|      "match"|        "method"|      "mod"|           "module"|   
        "mutable"|   "new"|          "object"|      "of"|            "open"|     
        "or"|        "private"|      "rec"|         "sig"|           "struct"|   
        "then"|      "to"|           "true"|        "try"|           "type"|     
        "val"|       "virtual"|      "when"|        "while"|         "with";


lexical Comment
	= @category="Comment" "(*" (![*] | Comment | "*" !>> [)])* "*)";         
	
lexical Whitespace = [\ \t\n\r];
	
layout Layout = (Comment | Whitespace)* !>> [\ \t\n\r] !>> "(*";
