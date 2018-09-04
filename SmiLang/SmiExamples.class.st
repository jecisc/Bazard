"
All the methods here cannot be executed in Smalltalk, they are SmiLang methods. Each method beginning by example is used in the SmiTests to validate the interpreters' behavior.
"
Class {
	#name : #SmiExamples,
	#superclass : #Object,
	#instVars : [
		'call'
	],
	#category : 'SmiLang-tests'
}

{ #category : #'as yet unclassified' }
SmiExamples class >> exampleId [
	^ 1
]

{ #category : #calls }
SmiExamples >> add: x to: y [
	^ y + x
]

{ #category : #examples }
SmiExamples >> example01Return [
	^ 1
]

{ #category : #examples }
SmiExamples >> example02Add [
	^ 1 + 2
]

{ #category : #examples }
SmiExamples >> example03Minus [
	^ 1 - 2
]

{ #category : #examples }
SmiExamples >> example04Temp [ 
	| t |
	t := 1 + 2.
	^ t + 3
]

{ #category : #examples }
SmiExamples >> example05Call [
	^ call one
]

{ #category : #examples }
SmiExamples >> example06CallArgs [
	^ call add: 3 to: 2
]

{ #category : #examples }
SmiExamples >> example07TempAndCallAndCallArgs [
	| t |
	t := call one.
	^ call add: t to: 2
]

{ #category : #examples }
SmiExamples >> example08NestedCall [
	^ call nestedCall
]

{ #category : #calls }
SmiExamples >> nestedCall [
	| var |
	var := call one + 2.
	^ call add: var to: call one
]

{ #category : #calls }
SmiExamples >> one [
	^ 1
]
