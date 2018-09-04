"
I am an abstract superclass over temps instructions. tempIndex is the index of the temporary variable to push or store into

tempIndex <Smi>
"
Class {
	#name : #SmiTempOperation,
	#superclass : #SmiStackOperation,
	#instVars : [
		'tempIndex'
	],
	#category : 'SmiLang-compiler'
}

{ #category : #'as yet unclassified' }
SmiTempOperation >> accept: visitor [
	^ visitor visitTempOperation: self
]

{ #category : #accessing }
SmiTempOperation >> tempIndex [
	^ tempIndex
]

{ #category : #accessing }
SmiTempOperation >> tempIndex: anObject [
	tempIndex := anObject
]
