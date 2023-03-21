Class {
	#name : #TrieNode,
	#superclass : #Object,
	#instVars : [
		'isWord',
		'childrenNodes'
	],
	#category : #'Collections-PrefixTree-Dictionaries'
}

{ #category : #adding }
TrieNode >> add: aString [

	| node |
	node := self childrenNodes at: aString first ifAbsentPut: [ TrieNode new ].
	aString size = 1
		ifTrue: [ node isWord: true ]
		ifFalse: [ node add: aString allButFirst ]
]

{ #category : #accessing }
TrieNode >> childrenNodes [

	^ childrenNodes
]

{ #category : #accessing }
TrieNode >> childrenNodes: anObject [

	childrenNodes := anObject
]

{ #category : #testing }
TrieNode >> includes: aString [

	| node |
	node := self childrenNodes at: aString first ifAbsent: [ ^ false ].

	aString size = 1 ifTrue: [ ^ node isWord ].

	^ node includes: aString allButFirst
]

{ #category : #initialization }
TrieNode >> initialize [

	super initialize.
	self isWord: false.
	self childrenNodes: IdentityDictionary new
]

{ #category : #accessing }
TrieNode >> isWord [

	^ isWord
]

{ #category : #accessing }
TrieNode >> isWord: anObject [

	isWord := anObject
]
