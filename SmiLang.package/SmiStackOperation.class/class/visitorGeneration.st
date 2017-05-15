code generation
visitorGeneration
	SmiStackOperation allSubclassesDo: [ :sub |
		sub compile: 'accept: visitor' , String cr , String tab , '^ visitor visit' , (sub name allButFirst: 3) , ': self'.
		SmiContextInterpreter compile: 'visit' , (sub name allButFirst: 3) , ': node' ]