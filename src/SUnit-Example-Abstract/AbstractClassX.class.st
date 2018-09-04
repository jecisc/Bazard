Class {
	#name : #AbstractClassX,
	#superclass : #Object,
	#category : 'SUnit-Example-Abstract'
}

{ #category : #'as yet unclassified' }
AbstractClassX >> anInt [
	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
AbstractClassX >> factForClass [
	^ self anInt factorial
]
