"
I am a return instruction. My activation pushes the top of stack on the context's sender or frame caller stack and the execution resumes the calling function.
"
Class {
	#name : #SmiReturnTop,
	#superclass : #SmiStackOperation,
	#category : 'SmiLang-compiler'
}

{ #category : #'as yet unclassified' }
SmiReturnTop >> accept: visitor [
	^ visitor visitReturnTop: self
]

{ #category : #printing }
SmiReturnTop >> printOn: s [
	s << 'returnTop'
]
