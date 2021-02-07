Class {
	#name : #NSAbstractSolver,
	#superclass : #Object,
	#instVars : [
		'resolver'
	],
	#category : #NonogramSolver
}

{ #category : #accessing }
NSAbstractSolver class >> priority [
	^ self subclassResponsibility
]

{ #category : #resolving }
NSAbstractSolver class >> resolve: aResolver [
	^ self new
		resolver: aResolver;
		resolve
]

{ #category : #accessing }
NSAbstractSolver class >> solvers [
	^ self allSubclasses sorted: #priority ascending
]

{ #category : #'as yet unclassified' }
NSAbstractSolver >> at: anInteger at: anInteger2 put: aState [ 
	resolver at: anInteger at: anInteger2 put: aState 
]

{ #category : #accessing }
NSAbstractSolver >> clueForColumn: columnIndex [ 
	^ resolver clueForColumn: columnIndex
]

{ #category : #accessing }
NSAbstractSolver >> clueForLine: lineIndex [
	^ resolver clueForLine: lineIndex
]

{ #category : #accessing }
NSAbstractSolver >> columnIsAllKnown: columnIndex [
	^ resolver columnIsAllKnown: columnIndex
]

{ #category : #testing }
NSAbstractSolver >> lineIsAllKnown: lineIndex [
	^ resolver lineIsAllKnown: lineIndex
]

{ #category : #accessing }
NSAbstractSolver >> numberOfColumns [
	^ resolver numberOfColumns
]

{ #category : #accessing }
NSAbstractSolver >> numberOfLines [
	^ resolver numberOfLines
]

{ #category : #resolving }
NSAbstractSolver >> resolve: aResolver [
	self subclassResponsibility
]

{ #category : #accessing }
NSAbstractSolver >> resolver: aNSResolver [ 
	resolver := aNSResolver
]
