Class {
	#name : #PrefixTreeNode,
	#superclass : #Object,
	#instVars : [
		'isWord',
		'childrenNodes',
		'parentNode'
	],
	#category : #'Collections-PrefixTree'
}

{ #category : #'instance creation' }
PrefixTreeNode class >> parentNode: aTrieNode [

	^ self new
		  parentNode: aTrieNode;
		  yourself
]

{ #category : #adding }
PrefixTreeNode >> add: aString [

	| node |
	node := self childrenNodes at: aString first ifAbsentPut: [ PrefixTreeNode parentNode: self ].
	aString size = 1
		ifTrue: [ node isWord: true ]
		ifFalse: [ node add: aString allButFirst ]
]

{ #category : #adding }
PrefixTreeNode >> addAllWordsTo: aCollection [

	String streamContents: [ :stream | self addAllWordsTo: aCollection currentPrefix: stream ]
]

{ #category : #adding }
PrefixTreeNode >> addAllWordsTo: aCollection currentPrefix: aStream [

	self isWord ifTrue: [ aCollection add: aStream contents ].
	self childrenNodes keysAndValuesDo: [ :letter :node |
		node addAllWordsTo: aCollection currentPrefix: (aStream copy
				 nextPut: letter;
				 yourself) ]
]

{ #category : #accessing }
PrefixTreeNode >> childrenNodes [

	^ childrenNodes
]

{ #category : #accessing }
PrefixTreeNode >> childrenNodes: anObject [

	childrenNodes := anObject
]

{ #category : #testing }
PrefixTreeNode >> includes: aString [

	| node |
	node := self childrenNodes at: aString first ifAbsent: [ ^ false ].

	aString size = 1 ifTrue: [ ^ node isWord ].

	^ node includes: aString allButFirst
]

{ #category : #initialization }
PrefixTreeNode >> initialize [

	super initialize.
	self isWord: false.
	self childrenNodes: IdentityDictionary new
]

{ #category : #accessing }
PrefixTreeNode >> isWord [

	^ isWord
]

{ #category : #accessing }
PrefixTreeNode >> isWord: anObject [

	isWord := anObject
]

{ #category : #accessing }
PrefixTreeNode >> parentNode [

	^ parentNode
]

{ #category : #accessing }
PrefixTreeNode >> parentNode: anObject [

	parentNode := anObject
]

{ #category : #printing }
PrefixTreeNode >> printWordOn: aStream [ 
	self parentNode ifNotNil: [ :node | node printWordOn: aStream ].
	aStream 
]

{ #category : #matching }
PrefixTreeNode >> word [

	String streamContents: [ :stream | self printWordOn: stream ]
]
