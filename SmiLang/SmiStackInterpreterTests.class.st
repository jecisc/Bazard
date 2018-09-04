Class {
	#name : #SmiStackInterpreterTests,
	#superclass : #SmiTests,
	#category : 'SmiLang-tests'
}

{ #category : #'as yet unclassified' }
SmiStackInterpreterTests >> interpreterClass [
	^ SmiStackInterpreter
]

{ #category : #tests }
SmiStackInterpreterTests >> testExample1 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 1) equals: 1
]

{ #category : #tests }
SmiStackInterpreterTests >> testExample2 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 2) equals: 3
]

{ #category : #tests }
SmiStackInterpreterTests >> testExample3 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 3) equals: -1
]

{ #category : #tests }
SmiStackInterpreterTests >> testExample4 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 4) equals: 6
]

{ #category : #tests }
SmiStackInterpreterTests >> testExample5 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 5) equals: 1
]

{ #category : #tests }
SmiStackInterpreterTests >> testExample6 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 6) equals: 5
]

{ #category : #tests }
SmiStackInterpreterTests >> testExample7 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 7) equals: 3
]

{ #category : #tests }
SmiStackInterpreterTests >> testExample8 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 8) equals: 4
]
