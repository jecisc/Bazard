Class {
	#name : #WeeklyWeight,
	#superclass : #Object,
	#instVars : [
		'week',
		'weights'
	],
	#category : #Weight
}

{ #category : #'as yet unclassified' }
WeeklyWeight >> average: aSymbol [
	^ (weights collect: aSymbol) average
]

{ #category : #initialization }
WeeklyWeight >> initialize [
	super initialize.
	weights := OrderedCollection new
]

{ #category : #printing }
WeeklyWeight >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPutAll: '(Week: ';
		print: self weekPrinting;
		nextPutAll: ' - '.
	(self average: #weight) printOn: aStream showingDecimalPlaces: 2.
	aStream nextPutAll: 'kg)'
]

{ #category : #accessing }
WeeklyWeight >> week [
	^ week
]

{ #category : #accessing }
WeeklyWeight >> week: anObject [
	week := anObject
]

{ #category : #printing }
WeeklyWeight >> weekPrinting [
	^ week asDate mmddyyyy
]

{ #category : #accessing }
WeeklyWeight >> weights [
	^ weights
]

{ #category : #accessing }
WeeklyWeight >> weights: anObject [
	weights := anObject
]
