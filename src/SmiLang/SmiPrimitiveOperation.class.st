"
I represent a primitive operation between Smis. My activation pops the two operands from the stack and push the primitive operation result.
"
Class {
	#name : #SmiPrimitiveOperation,
	#superclass : #SmiStackOperation,
	#instVars : [
		'selector'
	],
	#category : 'SmiLang-compiler'
}

{ #category : #'as yet unclassified' }
SmiPrimitiveOperation >> accept: visitor [
	^ visitor visitPrimitiveOperation: self
]

{ #category : #printing }
SmiPrimitiveOperation >> printOn: s [
	s << 'primitive: ' << selector
]

{ #category : #accessing }
SmiPrimitiveOperation >> selector [
	^ selector
]

{ #category : #accessing }
SmiPrimitiveOperation >> selector: anObject [
	selector := anObject
]
