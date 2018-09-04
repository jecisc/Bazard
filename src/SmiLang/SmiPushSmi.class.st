"
I represent a push Smi constant on stack. My activation pushes the Smi I hold as instance variable on the stack.
"
Class {
	#name : #SmiPushSmi,
	#superclass : #SmiStackOperation,
	#instVars : [
		'smi'
	],
	#category : 'SmiLang-compiler'
}

{ #category : #'as yet unclassified' }
SmiPushSmi >> accept: visitor [
	^ visitor visitPushSmi: self
]

{ #category : #printing }
SmiPushSmi >> printOn: s [
	s << 'push ' << smi printString
]

{ #category : #accessing }
SmiPushSmi >> smi [
	^ smi
]

{ #category : #accessing }
SmiPushSmi >> smi: anObject [
	smi := anObject
]
