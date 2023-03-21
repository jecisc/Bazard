Class {
	#name : #PrefixTree,
	#superclass : #Object,
	#instVars : [
		'roots'
	],
	#category : #'Collections-PrefixTree'
}

{ #category : #adding }
PrefixTree >> add: aString [

	aString ifEmpty: [ ^ self ].
	self roots add: aString
]

{ #category : #accessing }
PrefixTree >> allWords [

	| words |
	words := OrderedCollection new.
	self roots addAllWordsTo: words.
	^ words
]

{ #category : #testing }
PrefixTree >> includes: aString [

	aString ifEmpty: [ self error: 'Cannot contain empty string' ].

	^ self roots includes: aString
]

{ #category : #initialization }
PrefixTree >> initialize [

	super initialize.
	self roots: PrefixTreeNode new
]

{ #category : #accessing }
PrefixTree >> roots [
	^ roots
]

{ #category : #accessing }
PrefixTree >> roots: anObject [
	roots := anObject
]
