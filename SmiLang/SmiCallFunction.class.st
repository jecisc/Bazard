"
I represent the static call instruction. The function called is the function instance variable. My execution activates the function.

function <SmiFunction>
"
Class {
	#name : #SmiCallFunction,
	#superclass : #SmiStackOperation,
	#instVars : [
		'function'
	],
	#category : 'SmiLang-compiler'
}

{ #category : #'as yet unclassified' }
SmiCallFunction >> accept: visitor [
	^ visitor visitCallFunction: self
]

{ #category : #accessing }
SmiCallFunction >> function [
	^ function
]

{ #category : #accessing }
SmiCallFunction >> function: anObject [
	function := anObject
]

{ #category : #printing }
SmiCallFunction >> printOn: s [
	s << 'call ' << function funcName
]
