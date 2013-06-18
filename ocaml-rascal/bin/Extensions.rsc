module Extensions

extend Names;

syntax PackageType
	 =	ModTypePath  
	 |	ModTypePath "with"  PackageConstraint  ("and" PackageConstraint)*
 	 ;  

 syntax PackageConstraint
 =	"type" TypeConstr "="  Typexpr
 ;
 	 