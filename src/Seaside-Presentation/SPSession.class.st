Class {
	#name : #SPSession,
	#superclass : #WASession,
	#instVars : [
		'rootComponent'
	],
	#category : #'Seaside-Presentation'
}

{ #category : #accessing }
SPSession >> rootComponent [
	^ rootComponent
]

{ #category : #accessing }
SPSession >> rootComponent: anObject [
	rootComponent := anObject
]
