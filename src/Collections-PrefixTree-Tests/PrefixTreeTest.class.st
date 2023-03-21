"
A PrefixTreeTest is a test class for testing the behavior of PrefixTree
"
Class {
	#name : #PrefixTreeTest,
	#superclass : #TestCase,
	#category : #'Collections-PrefixTree-Tests'
}

{ #category : #tests }
PrefixTreeTest >> testAdd [

	| tree |
	tree := PrefixTree new.
	tree add: 'test'.
	self assert: (tree includes: 'test')
]

{ #category : #tests }
PrefixTreeTest >> testAllWords [

	| tree |
	tree := PrefixTree new.
	tree
		add: 'test';
		add: 'foo';
		add: 'testons'.
	self assertCollection: tree allWords hasSameElements: #( test foo testons )
]

{ #category : #tests }
PrefixTreeTest >> testIncludes [

	| tree |
	tree := PrefixTree new.
	tree
		add: 'test';
		add: 'foo';
		add: 'testons'.
	self assert: (tree includes: 'test').
	self assert: (tree includes: 'testons').
	self assert: (tree includes: 'foo').

	self deny: (tree includes: 'fo').
	self deny: (tree includes: 'testo')
]
