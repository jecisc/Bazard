Class {
	#name : #SmiPushTemp,
	#superclass : #SmiTempOperation,
	#category : 'SmiLang-compiler'
}

{ #category : #'as yet unclassified' }
SmiPushTemp >> accept: visitor [
	^ visitor visitPushTemp: self
]

{ #category : #printing }
SmiPushTemp >> printOn: s [
	s << 'pushTemp: ' << tempIndex printString
]
