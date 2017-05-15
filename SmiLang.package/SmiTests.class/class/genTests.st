as yet unclassified
genTests
	| numExamples |
	"
	self subclasses do: [ :each | each genTests ]
	"
	numExamples := (self exampleMethods select: [ :each | each selector beginsWith: #example ]) size.
	1 to: numExamples do: [ :i |
		self 
			compile: 'testExample' , i printString , String cr , String tab ,
			'<generatedFrom: #genTests>' , String cr , String tab ,
			'self assert: (self compileAndRun: ' , i printString , ') equals: ' , (self expectedResults at: i) printString
		 	classified: #tests
		]