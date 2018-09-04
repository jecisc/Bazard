"
All the operations that can exist in SmiFunctions
"
Class {
	#name : #SmiStackOperation,
	#superclass : #Object,
	#category : 'SmiLang-compiler'
}

{ #category : #'code generation' }
SmiStackOperation class >> visitorGeneration [
	SmiStackOperation allSubclassesDo: [ :sub |
		sub compile: 'accept: visitor' , String cr , String tab , '^ visitor visit' , (sub name allButFirst: 3) , ': self'.
		SmiContextInterpreter compile: 'visit' , (sub name allButFirst: 3) , ': node' ]
]
