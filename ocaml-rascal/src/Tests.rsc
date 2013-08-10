module Tests

import OCaml;
import Jigll;
import IO;
import String;
import util::FileSystem;
import Set;
import List;
import String;
import ParseTree;
import Node;
import Type;

str filePath = "Users/aliafroozeh/workspace/ocaml-operator-ambiguity-experiment/ocaml-4.00.1/testsuite/tests/";

public void run() {	 
	files = readFileLines(|file:///| + filePath + "/" + new.txt);
	for (f <- files) {
		runFile(f);
	}
}

public void runFile(str f) {
		print(f + "...");
		try {
			tree = jparse(#start[Implementation], readFile(|file:///| + filePath + "/" + f));
			
			if (/amb(_) := tree) {
				tree = filterOCaml(tree);
				if(/amb(_) := tree) {
					println("Ambiguous!");
					return;
				}
			} 
		
			s = printAST(tree);
   			writeFile(|file:///| + filePath + "/" + (f + ".rascal"), s);
			println("OK");
		}
		catch ParseError(el) : {
			println("Parse Error");
		}	
	
}
 
public void do(type[&T <: Tree] nont, str input) {
   x = jparse(nont, input);
   y = filterOCaml(x);
   if(/amb(_) := y) {
      println("Disambiguation failed!");
      return;
   }
   s = printAST(y);
   writeFile(|file:///Users/ali/Desktop/file1.txt|, s);
   //println(s);
}


&T<:Tree filterOCaml(&T<:Tree p) = visit(p) {
  case amb(alts) :{
      
	  if({*_, field(Expr _, field_name), Expr x, *_} := alts) {
	  	insert amb({x});
	  }

	  if({x:polyVariant(_, _), functionApplication(_, _)} := alts) {
	    insert amb({x});
	  }
	  
	  if({x:constrExp(_, _), functionApplication(_, _)} := alts) {
	    insert amb({x});
	  }
	  
	  if({Expr x, functionApplication(_, _)} := alts) {
	    insert amb({x});
	  }	  
	  	  
	  fail;
  }
  
};

&T<:Tree amb({&T elem}) = elem;

default set[Expr] filterOCaml(set[Expr] x) = x;

map[str,str] renamings = ("plus":"+");

str printAST(Tree x) = printAST(implode(#value, x));

str printAST(value v) {

  switch (v) {
  
    case "toplevels"(l) : return "
    							 '(
    							  <for (e <- l) {>
                                 '  <printAST(e)>
                                 <}>
                                 ')";
                                 
   case "toplevels1"(l, exp) : return "
    							 '(
    							  <for (e <- l) {>
                                 '  <printAST(e)>
                                 <}>
                                 '  <printAST(exp)>
                                 ')";

   case "toplevels1"(l, def) : return "
    							 '(
    							  <for (e <- l) {>
                                 '  <printAST(e)>
                                 <}>
                                 '  <printAST(def)>
                                 ')";
                                 
    case "definitions"(l) :   return "
    								 '(
    								 <for (<e,_> <- l) {>
                                     '  <printAST(e)>
                                     <}>
                                     ')";   
             
             
    case "topLevelDefinitions"(l): return "
    									 <for (d <- l){>
    									 ' <printAST(d)>
    									 <}>
    									 ";         

    case "specifications"(l) :   return "
    									'(
    									<for (e <- l) {>
                                        '  <printAST(e)>
                                        <}>
                                        ')";     
                                     
    case "expr"(x) : return printAST(x);
                            
                   
                   
    // Expressions
    
    case "prefix"(s, e) : return "
    							 ' <s>
    							 ' (
    							 ' <printAST(e)>
    							 ' )
    							 ";
                                                               
    case "field"(e, fieldName) :  return "field
    									 '(
    									 '<printAST(e)>
    									 '<printAST(fieldName)>
    									 ')
    									 ";  
    									 
    case "semicolon"(e): return printAST(e);									    
    
    case "field_name"(n) : return "<n>";             
        
    case "constrExp" (c, e) : return "
    								 '<printAST(c)>
    								 '   <printAST(e)>
    								 ";
    								 
    case "polyVariant"(c, e): return "
    								 '<printAST(c)>
    								 '   <printAST(e)>
    								 ";								  
    								 
    case "constr"(x) : return printAST(x);								    
    								 
    case "trueConstant"(): return "true";
    
    case "falseConstant"(): return "false";    								    

	case "const"([], n) : return printAST(n);
	
	case "const"(p, n) : return "<printAST(p)>.<printAST(n)>";
	
	case "constrName"(n) : return "<n>";                             
                            
    case "ifThenElse"(cond, thenPart, elsePart) : return "ifthenelse
													 '(
													 ' if
													 ' (
	    											 '  <printAST(cond)>
	    											 ' )
	    											 ' then
	    											 ' (
	    											 '  <printAST(thenPart)>
	    											 ' )
	    											 ' else
	    											 ' (
	    											 '  <printAST(elsePart)>
	    											 ' ) 
	    											 ')
	    											 ";
	    											 	    											 
    											  
    case "ifThen"(cond, thenPart) :  return "ifthenelse
    									   '(
    									   ' if
    									   ' (
    									   '  <printAST(cond)>
    									   ' )
    									   ' then
    									   ' (
    									   '  <printAST(thenPart)>
    									   ' )
    									   ' else
    									   ' (
    									   ' )
    									   ')
    									   ";
    									   
    											  
    case "sep"(e1, e2) : return "
    							'sequence
    							'(
    							'  <printAST(e1)>
    							';
    							'  <printAST(e2)>
    							')
    							";	
    				
    // "for" Ident "=" Expr ( "to" | "downto" ) Expr "do" Expr "done"							
    case "forloop"(ident, e1, _, e2, e3) : return " for <ident>
    														  ' <printAST(e1)>
    														  ' <printAST(e2)>
    														  ' <printAST(e3)>
    														  ";			
    														  
    														  
    case "whileloop"(e1, e2) : return "
    									 ' while
    									 ' <printAST(e1)>
    									 ' <printAST(e2)>	 
    									 ";
    									 
    case "tryBlock"(e, p) : return "
    							   'try
    							   '<printAST(e)>
    							   '(
    							   '<printAST(p)>
    							   ')
    							   ";
    							   
    case "assertExpr"(x) : return "assert <printAST(x)>";
    
    case "brackets1"(e, t) : return "
    								'(
    								'<printAST(e)>
    								':
    								'<printAST(t)>
    								')
    								";
    
    case "beginEnd"(e) : return printAST(e);			
    
    case "new"(e) : return "new <printAST(e)>";
    							   		
    							   		
    case "hash"(e, m): return "send <m>
    						  '(
    						  ' <printAST(e)>
    						  ')
    						  ";
    						  
    
    case "unaryMinus"(e): return "-<printAST(e)>";	
    
    case "letModule"(name, moduleExpr, e): return "let module <name>
    											  '  (
    											  '		<printAST(moduleExpr)>
    											  '  )
    											  '  in
    											  '  (
    											  '     <printAST(e)>
    											  '  )
    											  ";					  
    						  
    						  
    case "when"([e]): return "when
    						'<printAST(e)>
    						";
    						
    case "when"([]): return "";												  
    									 
    							     
    case "posInt"(i) : return "<convert(i)>";
    
    case "negInt"(i) : return "<convert(i)>";
    
    case "stringLiteral"(s) : return "<escape(s, (("\n": "\\n")))>";	
    
    case "charLiteral"(c): return "<toHex(c)>";
    
    case "floatLiteral"(f) : return "<f>";						     
                            
    case "coloncolon"(lhs,rhs) : return "::
                                   '(
                                   '    <printAST(lhs)>
                                   '    <printAST(rhs)>
                                   ')"; 
                                   
    case "listCons"(lhs,rhs) : return "
    						   '::
                               '(
                               '    <printAST(lhs)>
                               '    <printAST(rhs)>
                               ')";                                
                  
                 
    case "patterns"(p, l) : return "
    						'(
    						' <printAST(p)>
     						 <for (el <- l) {>
	    					 '	<printAST(el)>
	    					 '<}>
    						')";
    						
    						
    case "patternAs"(p, valueName): return "alias <valueName>
    									   '(
    									   '  <printAST(p)>
    									   ')
    									   ";					

	case "constrPattern"(constr, p) : return 
									  "
									  '<printAST(constr)>
									  '<printAST(p)>
									  ";    		
									  
	case "patternBar"(p1, p2): return
									  "
									  'pat_or
									  '(
									  ' <printAST(p1)>
									  ' <printAST(p2)>
									  ')
									  ";
									  
	
	case "patternRange"(c1, c2): return "pat_or
										'(
										'<printAST("range"(toHexList(c1, c2)))>
										')
										";  	

	case "range"([c1, c2]) : return "
								    '<c1>
									'<c2>
									";							  
	
	case "range"([c1, *l]) : return "
									'<c1>
									'pat_or		
									'(
									'<printAST("range"(l))>   
									')";
										  
									  
	case "patternBrackets"(p) : return printAST(p);
	
	case "patternTypexprBrackets"(p) : return printAST(p);	
	
	case "anyPattern"() : return "_";
	
	case "patternConstant"(x) : return printAST(x); 		
	
	case "patternValueName"(x) : return printAST(x);	
	
	// "[|" {Pattern ";"}+ ";"? "|]"
	case "patternArray"(l, _): return "array
										 '(
										 <for(x <- l) {>
										 '  <printAST(x)>
										 <}>
										 ')
										 ";
                            
    case str name(lhs,op,rhs) : if (/infix.*/ := name) return "<op>
                                       '(
                                       '    <printAST(lhs)>
                                       '    <printAST(rhs)>
                                       ')"; 
                                else fail;
                                
    case "dotBracket1"(e1, e2) : return "Array.get
												'(
												' <printAST(e1)>
												' <printAST(e2)>
												')
												";


    case "dotBracket2"(e1, e2) : return "String.get
												'(
												' <printAST(e1)>
												' <printAST(e2)>
												')
												";

    case "dotBracket3"(e1, e2) : return "Bigarray.Array1.get
												'(
												' <printAST(e1)>
												' <printAST(e2)>
												')
												";

                                
    									
    case "letbinding"(_, l, e) : return "
    									'let
    									'(
    									' (
    									  <for (x <- l) {>
    									'  <printAST(x)>
    									  <}>
    									' )
    									'in
    									'  <printAST(e)>
    									')
    									";

   case "assign1"(e1, f, e2) : return "setfield
   									  '(
   								      '<printAST(e1)>
   								      '<printAST(f)>
									  '<printAST(e2)>
									  ')
									  ";
									  
									  
    case "assign2"(e1, e2, e3) : 
    								return "Array.set
    									'(
    									' <printAST(e1)>
    									' <printAST(e2)>
    									' <printAST(e3)>
    									')
    									";
    									
       case "assign3"(e1, e2, e3) : 
    								return "String.set
    									'(
    									' <printAST(e1)>
    									' <printAST(e2)>
    									' <printAST(e3)>
    									')
    									";
   
       case "assign4"(e1, e2, e3) : 
    								return "Bigarray.Array1.set
    									'(
    									' <printAST(e1)>
    									' <printAST(e2)>
    									' <printAST(e3)>
    									')
    									";
    									
	
	case "assign5"(i, e3) : return "Array.set
									'(
									' <printAST(i)>
									' <printAST(e3)>
									')
								   ";    
                                
    case "comma"(e, l) : return "
    					 '(
    					 <printAST(e)>
    					 <for (exp <- l) {>
    					 '	<printAST(exp)>
    					 <}>
    					 ')
    					 ";                            
                                
    case "functionApplication"(e,args) : return "<printAST(e)>
                                                   '(
                                                   '    <printAST(args)>
                                                   ')";

    case "letBinding"(p, [], _, e) :
							    	return "
							               ' <printAST(p)>
							               ' <printAST(e)> 
							    		   ";

    		   
    case "letBinding"(p, [param], _, e) :
    	return "
               ' <printAST(p)>
               '(
               ' case
               '     (
               ' 	  <printAST(param)>
               '      <printAST(e)>
               '     )
               ')
    		   ";		   
   
   
    case "letBinding"(p, [first, *rest], t, e) :
    	return "
               ' <printAST(p)>
               '(
               ' case
               '     (
               '  		<printAST("letBinding"(first, rest, t, e))>
               '     )
               ')
    		   ";
      
    case "brackets"(x) : return printAST(x);
    
    case "tupl"([], _): return "[]";
        
    // [a;b;c]
    case "tupl"([e, *x], a): return "::
    						  ' (
    						  ' <printAST(e)>\n <printAST("tupl"(x, a))>
    						  ' ) 
    						  ";
    						  
   // [| a; b; c]
   case "array"(l, _): return "
   							  'array
   							  '(
   							  <for (x <- l) {>
   							  ' <printAST(x)>
   							  <}>
   							  ')
   							  ";    
                         
   case "function"(x) : return "(
   							   ' <printAST(x)>
   							   ')
   							   ";
   							   
   case "fun"(x) : return "(
   						  ' <printAST(x)>
   						  ')
   						  ";							   
                         
                         
    case "match"(e, patternMatching) : 
		return "match
			   '<printAST(e)>
			   '(
			   '<printAST(patternMatching)>
			   ')
			   ";
			   
   
	case "patternMatching"(_, pattern, whenExpr, e, ips) : return "
														 'case
														 '(
	        											 '  <printAST(pattern)>
	        											 '  <printAST("when"(whenExpr))>
	        											 '  <printAST(e)>
	        											 ') 
	        											 <for (ip <- ips) {>
	        											 '  <printAST(ip)> 
	        											 <}>
	        											 ";
	        											 
	        											 
	case "innerPatternMatching"(pattern, whenExpr, e) : return "
													   'case
													   '(
													   ' <printAST(pattern)>
													   ' <printAST("when"(whenExpr))>
													   ' <printAST(e)>
													   ')
													   "
													   ;                   											 
	        											 	        											 
	case "multipleMatching"([], whenExpr, e) : return "
													 '<printAST("when"(whenExpr))>
													 '<printAST(e)>
													 ";
													 
	case "multipleMatching"([p], whenExpr, e) : return "
													 'case
													 '(
													 '<printAST(p)>
													 '<printAST("when"(whenExpr))>
													 '<printAST(e)>
													 ')
													 ";        											 
													         											 
	        											 
	case "multipleMatching"([p1, *rest], whenExp, e) : return "
													'case
													'(
													'  <printAST(p1)>
													'  (
													'  <printAST("multipleMatching"(rest, whenExp, e))>
													'  )
													')													
													";        											 
	        											 
	        											 
    case "constant"(x) : return printAST(x);
    
    case "emptyParenthesis"() : return "()";
    
    case "typeDefinition"(l) : return "type
  								      '(  						
    							    	<for(typeDef <- l) {> 
								      '  <printAST(typeDef)>
								        <}>
								      ')";
								   
	
	case "typeDef"(params, constrName, info): return 
											   " <printAST(constrName)>
											   ' type
											   ' params=
											   ' (
											   ' <printAST(params)>
											   ' )
											   ' cstrs =
											   ' (
											   ' )
											   ' kind =
											   ' <printAST(info)>
											   ";
											   
											   
	case "typeInformation"(typeEquation, rep, constraints): return "<printAST(typeEquation)>
														 '<printAST(rep)>
														  <for(c <- constraints) {>
							   							 ' <printAST(c)>
							     						  <}>
														 ";


	case "typeEquation"(typexpr) : return printAST(typexpr);


    case "polytype1"(typexpr) : return "poly
                                       '<printAST(typexpr)>
                                       ";
    // ("\'" Ident)+ "." Typexpr
    case "polytype2"(l, t) : return "poly
                      				<for (id <- l) {> \'<id> <}>
    								' <printAST(t)>
                                    ";
	
	case "fieldDecls"(_, l, _) : return "
							   '(
							     <for(fieldDecl <- l) {>
							   ' <printAST(fieldDecl)>
							     <}>
							   ')
	                           ";
	                           
	case "constrDecls"(_, _, l) : return "
								  '(
								  <for(constrDecl <- l) {>
								  '<printAST(constrDecl)>
								  <}>
								  ')
								  ";         
								  
	case "path_field_name"(path, name) : return "<printAST(path)>.<name>";
	
	
	// ConstrName ("of" { Typexpr !star "*"}+)?                           
	case "constDecl1"(constrName, l): return
									"<printAST(constrName)>
									'(
									<for(typexpr <- l) {>
								    ' <printAST(typexpr)>
								     <}>
								    ')
								    "; 
								    
	
	case "fieldDecl"(_, name, typexpr): return "
												'<name>
												'<printAST(typexpr)>";
	
	case "typeConstr"([], typeconstrName) : return "<typeconstrName>";
	
	case "typeConstr"([path], typeconstrName) : return "<printAST(path)>.<typeconstrName>";					                            
	                           
	case "TypeConstraint"(ident, typexpr): return
										  " <ident> = <typexpr>
										  ";
										  
	case "record1"(field, [], l, _) : return "record
											   '(
											   ' <printAST(field)>
											   ' <printAST(field)>
										   	     <for (<a, []> <- l) {>
											   '  <printAST("fieldExpr"(a, a))>
											   	 <}>
											   ')";										
										  
	case "record1"(field, [expr], l, _) : return "record
											   '(
											   ' <printAST(field)>
											   ' <printAST(expr)>
										   	     <for (<a, b> <- l) {>
											   '  <printAST("fieldExpr"(a, b))>
											   	 <}>
											   ')";											   
											   
	case "fieldExpr"(field, expr) : return "
										   ' <printAST(field)>
										   ' <printAST(expr)>
										   ";		
										   
	case "singleTypeParam"(param): return printAST(param);
	
	
	case "typeParamList"(l) : return "
									 <for (param <- l) {>
									 ' <printAST(param)>
									 <}>
									 ";
										   
										   
	case "typeParam1"(x, ident) : return "
										 ' <printAST(x)>
										 ' <printAST(ident)>
										 ";					
										 
	case "typeParam2"(v) : return "
										 ' <printAST(v)>_
										 ";				
										 
										 
    // exception1: "exception" ConstrName ("of" Typexpr ("*" Typexpr)* )?
    case "exception1"(constrName, [<t, l>]): return "exception <constrName>
    										 '(
    										 '<printAST(t)>
    										 <for (x <- l) {>
    										 '<printAST(x)>
    										 <}> 
    										 ')
    										 ";
    										 
   	case "exception1"(constrName, []): return "exception <constrName>";									 
    										 

    // exception2: "exception" ConstrName "=" Constr
	case "exception2"(constrName, constr) : return "exception
												   '<printAST(constrName)>
												   '<printAST(constr)>
												   ";   	
   								     									 											 				   

   // Typexpr
   case "star"(typexpr, l) : return "tuple
   							        '(
   									' <printAST(typexpr)>
   									<for (x <- l) {>
									'  <printAST(x)>
									<}>
									')
   								    ";
   								    
   	case "polytype2"(l, t) : return "poly
   									'<for (ident <- l) {>\' <ident>
   									<}>
   									'<printAST(t)>
   									";							    
   								    
   	case "arrow1"(t1, t2) : return "arrow
   								   '<printAST(t1)>
   								   '<printAST(t2)>
   								   ";							    
   								    
   								    
    case "tagg"(ident) : return "<ident>";	
    
    
    case "typeExprBrackets"(t) : return printAST(t);
    
    
    // "(" {Typexpr ","}+ ")" TypeConstr
    case "typeExprBrackets2"(l, c): return "
    									   ' <printAST(c)>
    									   '    (
    									   	<for (x <- l) {>
    									   '	 <printAST(x)>				
    									   	<}>   
    									   '    ) 
    									   ";
    
    case "typexprConstr2"(c) : return "
								  '<printAST(c)>
								  '(
								  ')
								  ";
    
    case "typexprConstr1"(e, c) : return "
    									' <printAST(c)>
    									' (
    									'   <printAST(e)>
    									' )
    									' 
    									"; 		
    									
    case "patternTypxprBrackets"(p, t): return "
    										   '<printAST(p)>
    										   '<printAST(t)>
    										   ";														    
										   
										   
    case [] : return "";
    
    case list[value] l : return "<printAST(head(l))><for (e <- tail(l)) {>
                                '<printAST(e)><}>";
                                
    case "emptyBrackets"() : return "[]";
    
    case "emptyArray"() : return "array
	    						 '(
	    						 ')";
    
    
    // Definitions
    
   // let _ = expr  (ignore "let")
   case "letDef"(_, letBinding(anyPattern(), l, x, e), lbs) : return          
   			 "<printAST("letBinding"("", l, x, e))> <for (lb <- lbs) {> <printAST(lb)> <}>";
    
    
    case "letDef"(_, letBinding, lbs): 
      return "let
             '(
           	 ' <printAST(letBinding)> <for (lb <- lbs) {> <printAST(lb)> <}>
             ')";
             

          
    //"module" ModuleName ( "(" ModuleName ":" ModuleType ")" )* ( ":" ModuleType )? "=" ModuleExpr
    case "moduleDef1"(name, [<modName, modType>, *rest], t , e) : return "module  <name>
			    								'functor <modName>
			    								'(
			    								' <printAST(modType)>
			    								' <printAST("functor"(rest, t, e))>
			    								')
    										    ";
    										    
    case "moduleDef1"(name, [<modName, modType>], t , e) : return "module  <name>
		    								'functor <modName>
		    								'(
		    								' <printAST(modType)>
											' <printAST(e)>
		    								')
										    ";
										    
	case "moduleDef1"(name, [], t , e) : return "module  <name>
		    								' <printAST(e)>
		    								' <printAST(t)>
										    ";
										    
    										   
    										   
   //patternTuple: "["  {Pattern ";"}+ ";"? "]"
   case "patternTuple"([first, *rest], semicolon) : return "::
   												   '(
   												   '  <printAST(first)>
   												   '  <printAST("patternTuple"(rest, semicolon))>
   												   ')
   												   ";
   
   case "patternTuple"([], semicolon): return "[]";
   
   case "tagNamePattern"(t, p): return "<printAST(t)>
    								   '<printAST(p)>
    								   ";
	    										    
    										    
    case "functor"([], t, e): return printAST(e);								    
    										    
    case "functor"([<modeName, modType>], t, e): return "functor <modeName>
    													'(
    													'  <printAST(modType)>
    													'  <printAST(e)>
    													')
    													";
    										       
    // "module" ModuleName ("(" ModuleName ":" ModuleType ")")* ":" ModuleType         
    case "moduleDef2"(n, l, t) : return "module <n>
    								 <for(<modName, modType> <- l) {>
    								 'functor <modName>
    								 '(
    								 ' <printAST(modType)>
    								 ')
    								 <}>
    								 '<printAST(t)>	
    								 ";					
    								 
    case "moduleExprType"(e, t) : return "
    									 '<printAST(e)>
    									 '<printAST(t)>
    									 ";
    									 

	case "modApp"(e1, e2) : return "<printAST(e1)>
								   '(
								   '<printAST(e2)>
								   ')
								   ";
								   
	case "functor"(name, t1, t2): return "functor <name>
												'(
												'  <printAST(t1)>
												'  <printAST(t2)>
												')
												";							   
    									 
    
     //struct1: "struct" ((Definition+ ";;") | (Expr ";;"))* "end"
    case "struct1"(l): return "struct
							  '(
							  <for (d <- l) {>
							  '<printAST(d)>
							  <}>
							  ')
							  ";
    
    
    // struct2: "struct" Definition+ "end"
	case "struct2"(l): return "struct
							  '(
							  <for (d <- l) {>
							  '<printAST(d)>
							  <}>
							  ')
							  ";    
    
    
    case "modExpModPath"(x): return printAST(x);

    case "exceptionDef"(x): return printAST(x);
    
    case "open"(modulePath): return "open <printAST(modulePath)>";
    
    case "modTypePath"(path): return printAST(path);
    
    case "floatUnaryMinus"(e): return "~-.
    								  '(
    								  '  <printAST(e)>
    								  ')
    								  ";
    
    
    // Specifications
    
    case "sig"(l) : return "signature
    						'(
		    				<for(<s,_> <- l) {>
		    				' <printAST(s)>
		    				<}>
		    				')";
    
    case "specificationVal"(x, t) : return "sig_value <x>
    								'value_description
    							    '<printAST(t)>
    							    '(
    							    ')
    								";
        
   
    case "modType1"(n, t) : return "module type <n>
    							   ' <printAST(t)>    								
    							   ";      
        
    case "typeDef"(t) : return printAST(t);
    
    case "include"(me) : return "include
    							'(
    							'  <printAST(me)>
    							')"
    							;
    							
    // Classes
    case "classDef"(c) : return printAST(c);
    
    case "classDefinition"(l) : return "class
    								   '(
    								   <for (classBinding <- l) {>
    								   '  <printAST(classBinding)>
    								   <}>
    								   ')
    								   ";
    								   
    								
	// "let" "rec"? LetBinding ("and" LetBinding)* "in" ClassExpr
   	case "letClass"(_, lb, l, ce) : return "let
   										   '(
   										   ' <printAST(lb)>
   										   <for (x <- l) {>
   										   ' <printAST(x)>
   										   <}>
   										   ')
   										   ' <printAST(ce)>
   										   ";
    								   
    								   
    case "object"(s) : return printAST(s);
    					      
    case "classBody"(_, l) : return "class_structure
    								'(
    								<for (field <- l) {>
    								'   <printAST(field)>
    								<}>
    								')
    								";					      								   							
    					
    // "virtual"? ("[" TypeParameters "]")? ClassName Parameter* (":" ClassType)? "=" ClassExpr								   
    case "classBinding"(_, _, className, params, t, classExpr) : return
    	"params = 
    	'(
    	<for (param <- params) {>
    	   '<printAST(param)>
    	<}>
    	')
    	'class name = <className>
    	'class expr = 
    	'            <printAST(classExpr)>
    	"; 								   
    
    // ("method" | "method!") "private"? MethodName Parameter* (":" Typexpr)? "=" Expr
    case "method1"(_, _, name, params, _, e) : return "method <name>
    												 '  <printAST(e)>
    												 ";
    												 
    	
    //  method2: "method" "private"? MethodName ":"  PolyTypExpr "=" Expr											 
    case "method2"(_, name, polyTypeExpr, e) : return "method <name>
    												 '	<printAST(e)>
    												 '	<printAST(polyTypeExpr)>
    												 ";
    						
    // method3: "method" "private"? "virtual" MethodName ":" PolyTypExpr
    case "method3"(_, name, e) : return "method <name>
    												 '   <printAST(e)>
    												 ";
    						
    						
    						
    // Names
    case "valuePath"("valuePath"([], n)) : return "<n>";
    
    case "valuePath"("valuePath"(p, n)) : return "<printAST(p)>.<n>";
    
    case "modulePath"([], n) : return "<n>";
    
    case "modulePath"(l, n) : return "
    								  <for (p <- l) {>
    							     ' <p>.<}><n>
    							     ";
    							     
    case "extendedModulePath1"([], n) : return "<n>";
    							     
    							     
    case "extendedModulePath1"(l, n): return "
		    								  <for (p <- l) {>
		    							      ' <p>.<}><n>
		    							      ";
    									 							     
    
    case "classPath"([], n): return "<n>";
    
    case "classPath"([m], n): return "<printAST(m)>.<n>";
    
    case "modTypePath"([], n): return "<n>";
    
    case "modTypePath"([ext], n): return "<printAST(ext)>.<n>";    
    
    case "external"(valName, t, extDecls): return 
    								"external <valName>
    								'(
    								' value_description
    								' <printAST(t)>
    								'(
    								' <printAST(extDecls)>
    								')
    								')              
    								";
     												 
    case "externalDecl"(l): return  "
    								<for (extDecl <- l) {>
    								'  <printAST(extDecl)>
    								<}>
    								";
    								
    								
    // Lexical 
    case "hexNumber"(first, rest) : return "0x<first><rest>";								
    								
    
    // TypeConstr = typeConstr: (ExtendedModulePath ".")? TypeconstrName;
    case "typeConstr"([], typeConstrName): return "<typeConstrName>";
    
    case "typeConstr"([e], typeConstrName): return "<printAST(e)>.<typeConstrName>"; 								
    										 
    												 
    case node n : {
      children = getChildren(n);
      name = getName(n);
      if(size(children) == 0) {
      	return "";
      }
      return "<renamings[name]?name> 
             '(<for (c <- children) {>
             '    <printAST(c)><}>
             ')";
    }
    
    case value v : return "<v>";
  } 
}

int convert(str s) {
	s = replaceAll(s, "\"", "");
	s = replaceAll(s, "_", "");
	
	if(/0(o|O).*/ := s) {
		return toInt(replaceFirst(replaceFirst(s, "o", ""), "O", ""), 8);
	}
	if(/0(b|B).*/ := s) {
		return toInt(replaceFirst(replaceFirst(s, "b", ""), "B", ""), 2);
	}
	//if(/0x|X.*/ := s) {
	//    s = replaceFirst(replaceFirst(s, "x", ""), "X", "");
	//    println(s);
	//	return toInt(s, 16);
	//}
	return toInt(s);
}

@javaClass{ocaml.Util}		
public java str toHex(str s);

@javaClass{ocaml.Util}		
public java list[str] toHexList(str first, str second);




