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
			tree = jparse(#start[TopLevel], readFile(|file:///| + filePath + "/" + f));
			
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
      
	  if({*_, field(_, _), x:valuePath(_), *_} := alts) {
	  	insert amb({x});
	  }
	  
	  // !Sys.interactive
	  if({*_, field(_, _), x:prefix(_, _), *_} := alts) {
	  	insert amb({x});
	  }
	  

	  if({x:polyVariant(_, _), functionApplication(_, _)} := alts) {
	    insert amb({x});
	  }
	  
	  if({x:constrExp(_, _), functionApplication(_, _)} := alts) {
	    insert amb({x});
	  }
	  
	  if({x:uneq(_, _), functionApplication(_, _)} := alts) {
	    insert amb({x});
	  }
	  
	  // parse 2 / 1 - 3 as - ((/ 2 1) 3) rather than (/ 2 (1 (-3))
	  
	  if({infix2(_, _, _), x:infix3(_, _, _)} := alts) {
	    insert amb({x});
	  }
	  
	  //3 + 2 -1
	  if({x:infix3(infix3(_, _, _), _, _), infix3(_, _, _)} := alts) {
	    insert amb({x});
	  }	   
	  	   
	  
	  if({Expr x, functionApplication(_, _)} := alts) {
	    insert amb({x});
	  }	  
	  
	  if({x:method1(_,_,_,_,_,_), y:method2(_,_,_,_)} := alts) {
	  	insert amb({x});
	  }
	  
	  if({x:letBinding(_, _, _, _), polyLetBiding(_, _, _)} := alts) {
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
    									 
    									 
    case "lazy"(e) : return "lazy
    					    '  <printAST(e)>
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
    								
    case "brackets3"(e, t1, t2): return "
    									'(
    									'  <printAST(e)>
    									'  :
    									'  <printAST(t1)>
    									'  <printAST(t2)>
    									')
    									";								
    
    case "beginEnd"(e) : return printAST(e);			
    
    case "new"(e) : return "new <printAST(e)>";
    							   		
    							   		
    case "hash"(e, m): return "send <m>
    						  '(
    						  ' <printAST(e)>
    						  ')
    						  ";
    	
    // "(" "module" ModuleExpr  (":" PackageType)? ")"					  
    case "moduleExpr"(m, []): return printAST(m);
    
    case "moduleExpr"(m, [p]): return "(
    								  ' <printAST(m)>
    								  ':
    								  ' <printAST(p)>
    								  ')
    								  ";

    case "unaryMinus"("constant"(p)): return "-<printAST(p)>";  // - 3 should be printed as "-3" not "~-(3)" based on 
    															// what we observed from the OCaml AST
    
    case "unaryMinus"(e): return "~-
    								'(
    								' <printAST(e)>
    								')";	
    
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
    								
    								
    case "typeParam"(x): return printAST(x);									 
    							     
    case "posInt"(i) : return "<convert(i)>";
    
    case "negInt"(i) : return "<convert(i)>";
    
    case "stringLiteral"(s) : return "<escape(s, (("\n": "\\n")))>";	
    
    case "charLiteral"(c): return "<toHex(c)>";
    
    case "floatLiteral"(f) : return "<f>";		
    
    case "int32"(x) : return "<substring(x, 0, size(x) - 1)>";
    
    case "int64"(x) : return "<substring(x, 0, size(x) - 1)>";
    
    case "nativeInt"(x) : return "<substring(x, 0, size(x) - 1)>";				     
                            
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
	
	case "patternValueName"(list[value] l) : return "<for (x <- l) {><printAST(x)><}>";
	
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
                                
    case "uneq"(lhs, rhs): return "!=
    							  '(
    							  '   <printAST(lhs)>
    							  '   <printAST(rhs)>
    							  ')  
                                  ";                            
                                
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

    case "dotBracket3"(e1, e2) : return "Bigarray.Array<getSize(e2)>.get
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
    								return "Bigarray.Array<getSize(e2)>.set
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
      					 ' <printAST(e)>
    					   <for (exp <- l) {>
    					 '	<printAST(exp)>
    					   <}>
    					 ')";                            
                                
    case "functionApplication"(e,args) : return "<printAST(e)>
                                                   '(
                                                   '    <printAST(args)>
                                                   ')";

    case "letBinding"(p, [], [], e) :
							    	return "
							               ' <printAST(p)>
							               ' <printAST(e)> 
							    		   ";

    case "letBinding"(p, [], [t], e) :
							    	return "
							               ' <printAST(p)>
							               ' (
							               '  <printAST(e)> 
							               '  :
							               '  <printAST(t)>
							               ' )
							    		   ";

    		   
    case "letBinding"(p, [param], [], e) :
    	if(!isPattern(param)) {
    	    	return "
               ' <printAST(p)>
               ' 	 <printAST(param)>
               '     <printAST(e)>
    		   ";		   
    	} else {
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
    	}
   
    case "letBinding"(p, [param], [t], e) :
    	return "
               ' <printAST(p)>
               '(
               ' case
               '     (
               ' 	  <printAST(param)>
               '	    (
               '      	 <printAST(e)>
               '         :
               '		 <printAST(t)>
               '		)
               '     )
               ')
    		   ";		   

	case "letBinding"(p, l, t, e) : {
            notP = [x | x <- l && !isPattern(x)];
            rest = l - notP;
            return "
            	   '  <printAST(p)>
            	   <for (x <- notP) {>
            	   '  <printAST(x)>
            	   <}>
	               '(
	               ' case
	               '     (
	               '  		<printAST("letBinding"(head(rest), tail(rest), t, e))>
	               '     )
	               ')
            	   ";   
       	}

   
    //case "letBinding"(p, [first, *rest], t, e) :
    //	if(!isPattern(first)) {
    //		return "
    //           ' <printAST(p)>
    //           ' <printAST(first)>
    //           '(
    //           ' case
    //           ' (
    //           <if(size(rest) == 1) {>
    //           '	<printAST("letBinding"(head(rest), [], t, e))>
    //           <} else {>
    //           '	<printAST("letBinding"(head(rest), tail(rest), t, e))>
    //           <}>
    //           ' )
    //           ')
    //		   ";
    //	} else {
    //	    return "
    //           ' <printAST(p)>
    //           '(
    //           ' case
    //           '     (
    //           '  		<printAST("letBinding"(first, rest, t, e))>
    //           '     )
    //           ')
    //		   ";
    //	}
      
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
											   '   type
											   '   params=
											   '   (
											   '   <printAST(params)>
											   '   )
											   '   cstrs =
											   '   (
											   '   )
											   '   kind =
											   '   <printAST(info)>
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
    										 
   	case "exception1"(constrName, []): return "exception <constrName>
   											  '(
   											  ')";									 
    										 

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
    
    
    // "(" Typexpr (";" Typexpr)+ ")" TypeConstr
    case "typeExprBrackets2"(t, l, c): return "
    									   ' <printAST(c)>
    									   '    (
    									   '     <printAST(t)>
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
    									 
	//moduleExprVal: "(" "val" Expr  (":" PackageType)? ")" 
	case "moduleExprVal"(e, []): return printAST(e);
	
	case "moduleExprVal"(e, [t]): return "
										 'module unpack
										 '(
										 '  <printAST(e)>
										 '  :
										 '  <printAST(t)>
										 ')
										 "; 	
										 
										 
	// "module" "rec" ModuleName ":"  ModuleType "="  ModuleExpr  ("and" ModuleName ":"  ModuleType "="  ModuleExpr)*
	case "modRec1"(n, t, e, l): return "rec module
									   '(
									   '  \"<printAST(n)>\"
									   '  <printAST(t)>
									   '  <printAST(e)>
									   <for(<mn, mt, me> <- l) {>
									   '  \"<printAST(mn)>\"
									   '  <printAST(mt)>
									   '  <printAST(me)>
									   <}>
									   ')
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
    
    case "include"(moduleExpr) : return "include
    							'(
    							'  <printAST(moduleExpr)>
    							')"
    							;
    							
    case "includeSpec"(moduleType) : return "include
    							'(
    							'  <printAST(moduleType)>
    							')"
    							;
    							
    							
    case "modTypeOf"(x): return printAST(x); 							
    					
    // ModuleType "with" ModConstraint ("and" ModConstraint)*							
    case "modTypeWith"(t, c, l): return "
    								    ' <printAST(t)>
    								    '  (
    								    '     <printAST(c)>
    								    <for (x <- l) {>
    								    '     <printAST(x)>	
    								    <}>
    								    '   )
    								    ";
    								    
    								    
   // "type" TypeParams? TypeConstr "=" Typexpr
   case "modConsType1"([], c, e): return " 
   										 ' <printAST(c)>
   										 ' type
										 ' params=
										 ' (
										 ' )
										 ' cstrs =
										 ' (
										 ' )
										 ' kind =
										 ' 
   										 '  <printAST(e)>
   										 ";
   										 
	// "type" TypeParameters?  TypeconstrName ":="  TypeParameters?  TypeConstr
	case "modConsType2"(params1, n, params2, c): return "
		   										   ' <printAST(n)>
		   										   ' type
												   ' params=
												   ' (
												   '   <printAST(params1)>
												   ' )
											       ' cstrs =
												   ' (
												   ' )
												   ' kind =
		   										   '  <printAST(c)>
		   										   ' (
		   										   '   <printAST(params2)>
		   										   ' )
		   										   ";
		   										   
	case "bracketModType1"(moduleType): return printAST(moduleType);		   										   
		   										   
	// modeConsModule1: "module" ModulePath "=" ExtendedModulePath
 	case "modeConsModule1"(modulePath, extendedModulePath): return "
 																   '<printAST(modulePath)>
 																   '<printAST(extendedModulePath)>
 																   ";
 																   
 	// modeConsModule2: "module" ModuleName ":="  ExtendedModulePath
 	case "modeConsModule2"(moduleName, extendedModulePath): return "
 																   '<printAST(moduleName)>
 																   '
 																   ";														   			 
    							
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
   										   
   	// ("val"|"val!") "mutable"? InstVarName (":" Typexpr)? "=" Expr
   	case "classValue"(_, _, n, _, e): return " <printAST(n)>
   											 ' <printAST(e)>
   											 ";									   
    								   
    // ("inherit" | "inherit!") ClassExpr ("as" ValueName)?
  	case "inheritance"(_, ce, []): return "inherit
											' constr <printAST(ce)>
											' (
											' )
										    ";
    								   
	case "inheritance"(_, ce, [vn]): return "inherit
											' constr <printAST(ce)>
											' (
											' )
										    ";
	
	case "classPath"(cp) : return printAST(cp);
	
	
	// (("?"? LabelName ":")? Typexpr "-\>")* ClassBodyType;
	case "classType"(l, cbt): return "class_type
									 ' fun
									 <for (<labelName, typexpr> <- l) {>
									 '	<printAST(labelName)>
									 '	<printAST(typexpr)>
									 <}>
									 '	<printAST(cbt)>
									 ";
	
	// classBodyType1: "object" ("(" Typexpr ")")? ClassFieldSpec* "end"
	case "classBodyType1"([], l): return "class_type
										 'signature
										 'class_signature
										 '(
										 <for(x <- l) {>
										 ' <printAST(x)>
										 <}>
										 ')
										 ";
										
	case "classBodyType1"([t], l): return "class_type
										  ' <printAST(t)>
										  <for(x <- l) {>
										  ' <printAST(x)>
										  <}>
										  ";
	
    // classBodyType2: ("[" Typexpr ("," Typexpr)* "]")? ClassPath
    case "classBodyType2"([], cp): return "class_type
     									  '   <printAST(cp)>
    									  ";
    
    case "classBodyType2"([<t, l>], cp): return "
    											'class_type
	    										'constr <printAST(cp)>
	    										'(
	    										' <printAST(t)>
	  	    									<for (x <- l) {>
		    									'	<printAST(x)>
		    									<}>
		    									')
		    									";
	
	// "\'" Ident ("," "\'" Ident)*;
	case "typeParameters"(x, l): return "
										' <printAST(x)>
										<for (i <- l) {>
										' <printAST(i)>
										<}>
										";
	
	// "class" {ClassBinding "and"}+;
	case "classDefinition"(l): return "class
									  <for (x <- l) {>
									  '  <printAST(x)>
									  <}>
									  ";
	
	case "classTypeDef"(x): return "<printAST(x)>";
	
	// "class" "type" ClasstypeDef ("and" ClasstypeDef)*;
	case "classTypeDefinition"(def, l): return "class_type
											   '(
											   '  <printAST(def)>
											   <for (x <- l){>
											   '  <printAST(x)>
											   <}>
											   ')
											   ";
											   	
	// "virtual"? ("[" TypeParameters "]")? ClassName "=" ClassBodyType;
	case "classTypeDef"(_, [], cn, cbt): return "class_type_declaration
													  'params = 
													  '(
													  ' 
													  ') 
													  'name = <printAST(cn)>
													  'expr =
													  ' <printAST(cbt)>
													  ";	
											   
	case "classTypeDef"(_, [params], cn, cbt): return "class_type_declaration
													  'params = 
													  '(
													  ' <printAST(params)>
													  ') 
													  'name = <printAST(cn)>
													  'expr =
													  ' <printAST(cbt)>
													  ";
					
	case "classSpec"(x) : return printAST(x);					
													  
	// "virtual"? ("[" TypeParameters "]")? ClassName ":" ClassType;
	case "classSpec"(_, _, cn, ct): return "sig_class
										' (
										'	class_description
										'	params = 
										'		(
										'		)
										'	name = <printAST(cn)>
										'	expr =
										'	<printAST(ct)>
										' )
										";
	// "class" ClassSpec ("and" ClassSpec)*;		
	case "classSpecification"(c, l): return "
											'  <printAST(c)>
											<for (x <- l) {>
											'  <printAST(x)>
											<}>
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
    case "valuePath"("valuePath"([], list[value] l)) : return "<for (x <- l) {><printAST(x)><}>";
    
    case "valuePath"("valuePath"([], n)) : return "<printAST(n)>";
    
    case "valuePath"("valuePath"(p, n)) : return "<printAST(p)>.<printAST(n)>";
        
    case "modulePath"([], n) : return "<n>";
    
    case "modulePath"(l, n) : return "
    								  <for (p <- l) {>
    							      <p>.<}><n>";
    							     
    case "extendedModulePath1"([], n) : return "<n>";
    							     
    case "extendedModulePath1"([ext], n): return "<printAST(ext)>.<n>";
    
    case "extendedModulePath2"(e1, e2): return "<printAST(e1)>(<printAST(e2)>)";
    
    case "classPath"([], n): return "<n>";
    
    case "classPath"([m], n): return "<printAST(m)>.<n>";
    
    case "modTypePath"([], n): return "<n>";
    
    case "modTypePath"([ext], n): return "<printAST(ext)>.<n>";    
    
    case "external"(list[value] l, t, extDecls): return 
    								"external <for (x <- l) {><printAST(x)><}>
    								'(
    								' value_description
    								' <printAST(t)>
    								'(
    								' <printAST(extDecls)>
    								')
    								')              
    								";

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
    								
    // Extensions
    case "packageType1"(p): return "package <printAST(p)>
    							   '(
    							   ')
    							   ";
    
    // ModTypePath "with"  PackageConstraint  ("and" PackageConstraint)*
    case "packageType2"(m, p, l): return "
    									 'package <printAST(m)> 
    									 '(
    									 'with type <printAST(p)>
    									 <for(x <- l){>
    									 '<printAST(x)>
    									 <}>
    									 ')
    									 ";
    									 
    // "type" TypeConstr "="  Typexpr
    case "packageConstraint"(tc, te): return "<printAST(tc)>
    										 '<printAST(te)>
    										 ";									 					
    												 
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
    
    case <x>: return printAST(x);
    
    case list[value] l : return "<printAST(head(l))><for (e <- tail(l)) {>
                                '<printAST(e)><}>";
    
    
    case value v : return "<v>";
  } 
}

bool isPattern(value v) {
	switch(v) {
		case "typeParam"(x): return false;
	}
	
	return true;
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

int getSize(value n) {
	switch(n) {
		case "comma"(e, l): return 1 + size(l);
	}
	
	fail;
}

@javaClass{ocaml.Util}		
public java str toHex(str s);

@javaClass{ocaml.Util}		
public java list[str] toHexList(str first, str second);




