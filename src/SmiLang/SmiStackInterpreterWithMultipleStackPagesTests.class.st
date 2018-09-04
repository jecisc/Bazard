Class {
	#name : #SmiStackInterpreterWithMultipleStackPagesTests,
	#superclass : #SmiTests,
	#category : 'SmiLang-tests'
}

{ #category : #'as yet unclassified' }
SmiStackInterpreterWithMultipleStackPagesTests >> interpreterClass [
	^ SmiStackInterpreterWithMultipleStackPages
]

{ #category : #tests }
SmiStackInterpreterWithMultipleStackPagesTests >> testExample1 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 1) equals: 1
]

{ #category : #tests }
SmiStackInterpreterWithMultipleStackPagesTests >> testExample2 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 2) equals: 3
]

{ #category : #tests }
SmiStackInterpreterWithMultipleStackPagesTests >> testExample3 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 3) equals: -1
]

{ #category : #tests }
SmiStackInterpreterWithMultipleStackPagesTests >> testExample4 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 4) equals: 6
]

{ #category : #tests }
SmiStackInterpreterWithMultipleStackPagesTests >> testExample5 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 5) equals: 1
]

{ #category : #tests }
SmiStackInterpreterWithMultipleStackPagesTests >> testExample6 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 6) equals: 5
]

{ #category : #tests }
SmiStackInterpreterWithMultipleStackPagesTests >> testExample7 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 7) equals: 3
]

{ #category : #tests }
SmiStackInterpreterWithMultipleStackPagesTests >> testExample8 [
	<generatedFrom: #genTests>
	self assert: (self compileAndRun: 8) equals: 4
]
