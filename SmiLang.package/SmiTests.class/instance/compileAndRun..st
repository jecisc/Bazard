helper
compileAndRun: numExample
	| func |
	func := self compileSmiExample: numExample.
	^ self interpreterClass new interpret: func
	
	