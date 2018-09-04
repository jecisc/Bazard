"
I represent a pop instruction. My execution pops the stack by 1.
"
Class {
	#name : #SmiPop,
	#superclass : #SmiStackOperation,
	#category : 'SmiLang-compiler'
}

{ #category : #'as yet unclassified' }
SmiPop >> accept: visitor [
	^ visitor visitPop: self
]

{ #category : #printing }
SmiPop >> printOn: s [
	s << 'pop'
]
