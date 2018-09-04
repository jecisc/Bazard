Class {
	#name : #SmiStoreTemp,
	#superclass : #SmiTempOperation,
	#category : 'SmiLang-compiler'
}

{ #category : #'as yet unclassified' }
SmiStoreTemp >> accept: visitor [
	^ visitor visitStoreTemp: self
]

{ #category : #printing }
SmiStoreTemp >> printOn: s [
	s << 'storeTemp: ' << tempIndex printString
]
