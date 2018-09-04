"
""Same as superclass but the stackpage are finite (size 10)""

	stackPages <Array of Array) list of available stack pages 
	indexOfCurrentStackPage <Smi> index of the currentStackPage in the stackPages inst var
"
Class {
	#name : #SmiStackInterpreterWithMultipleStackPages,
	#superclass : #SmiStackInterpreter,
	#instVars : [
		'stackPages',
		'indexOfCurrentStackPage'
	],
	#category : 'SmiLang-stack interpreter'
}

{ #category : #private }
SmiStackInterpreterWithMultipleStackPages >> activateFunction: func [
	"In addition to superclass, if not enough room on stack, switch to another stack page"
]

{ #category : #initialization }
SmiStackInterpreterWithMultipleStackPages >> initialize [

	super initialize.
 
	stackPages := self newStackPages.
	indexOfCurrentStackPage := 1.
	currentStackPage := stackPages at: indexOfCurrentStackPage
]

{ #category : #initialization }
SmiStackInterpreterWithMultipleStackPages >> newStackPages [
	^ (1 to: self numStackPages) collect: [ :i | self newStackPage ]
]

{ #category : #initialization }
SmiStackInterpreterWithMultipleStackPages >> numStackPages [

	^ 3
]

{ #category : #initialization }
SmiStackInterpreterWithMultipleStackPages >> stackPageSize [

	^ 10
]

{ #category : #visiting }
SmiStackInterpreterWithMultipleStackPages >> visitReturnTop: node [
	"In addition to super class, handles return across stack pages"
]
