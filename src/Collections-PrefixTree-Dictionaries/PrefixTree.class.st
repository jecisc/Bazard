Class {
	#name : #PrefixTree,
	#superclass : #Object,
	#instVars : [
		'roots'
	],
	#category : #'Collections-PrefixTree-Dictionaries'
}

{ #category : #adding }
PrefixTree >> add: aString [

	aString ifEmpty: [ ^ self ].
	self roots add: aString
]

{ #category : #accessing }
PrefixTree >> allWords [
	| result|
	result := OrderedCollection new.
	^ self roots keys
]

{ #category : #testing }
PrefixTree >> includes: aString [

	aString ifEmpty: [ self error: 'Cannot contain empty string' ].

	^ self roots includes: aString
]

{ #category : #initialization }
PrefixTree >> initialize [

	super initialize.
	self roots: TrieNode new
]

{ #category : #accessing }
PrefixTree >> roots [
	^ roots
]

{ #category : #accessing }
PrefixTree >> roots: anObject [
	roots := anObject
]
