module Extensions

extend Names;

syntax PackageType
	 =	packageType1: ModTypePath  
	 |	packageType2: ModTypePath "with"  PackageConstraint  ("and" PackageConstraint)*
 	 ;  

 syntax PackageConstraint
 =	packageConstraint: "type" TypeConstr "="  Typexpr
 ;
 	 