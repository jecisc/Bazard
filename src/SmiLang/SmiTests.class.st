Class {
	#name : #SmiTests,
	#superclass : #TestCase,
	#category : 'SmiLang-tests'
}

{ #category : #'as yet unclassified' }
SmiTests class >> exampleMethods [
	^ SmiExamples methods
]

{ #category : #'as yet unclassified' }
SmiTests class >> expectedResults [
	^ #(1 3 -1 6 1 5 3 4)
]

{ #category : #'as yet unclassified' }
SmiTests class >> genTests [
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
]

{ #category : #helper }
SmiTests >> compileAndRun: numExample [
	| func |
	func := self compileSmiExample: numExample.
	^ self interpreterClass new interpret: func
	
	
]

{ #category : #helper }
SmiTests >> compileSmiExample: numExamples [
	^ self compilerClass new 
		compilePharoMethod: (self examplesMethodsSorted at: numExamples)
	
]

{ #category : #helper }
SmiTests >> compilerClass [ 
	^ SmiCompiler
	
]

{ #category : #helper }
SmiTests >> examplesMethodsSorted [
	^ (self class exampleMethods select: [ :each | each selector beginsWith: #example ])
		sort: [ :m1 :m2 | 
			m1 methodClass exampleId = m2 methodClass exampleId
				ifTrue: [ m1 selector <= m2 selector ]
				ifFalse: [ m1 methodClass exampleId < m2 methodClass exampleId ] ]
]
