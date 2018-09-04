Class {
	#name : #SmiContextInterpreterTests,
	#superclass : #SmiTests,
	#category : 'SmiLang-tests'
}

{ #category : #helper }
SmiContextInterpreterTests >> interpreterClass [
	^ SmiContextInterpreter
	
	
]

{ #category : #tests }
SmiContextInterpreterTests >> testExample1 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 1) equals: 1
]

{ #category : #tests }
SmiContextInterpreterTests >> testExample2 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 2) equals: 3
]

{ #category : #tests }
SmiContextInterpreterTests >> testExample3 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 3) equals: -1
]

{ #category : #tests }
SmiContextInterpreterTests >> testExample4 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 4) equals: 6
]

{ #category : #tests }
SmiContextInterpreterTests >> testExample5 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 5) equals: 1
]

{ #category : #tests }
SmiContextInterpreterTests >> testExample6 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 6) equals: 5
]

{ #category : #tests }
SmiContextInterpreterTests >> testExample7 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 7) equals: 3
]

{ #category : #tests }
SmiContextInterpreterTests >> testExample8 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 8) equals: 4
]
