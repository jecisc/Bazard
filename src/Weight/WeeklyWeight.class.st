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

{ #category : #'as yet unclassified' }
WeeklyWeight >> gtInspectorIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite fastTable
		title: 'Values';
		display: [ :aCollection | 
			{('Week' -> self weekPrinting)}
				,
					(#(#weight #bmi #fat #fatFree #subcutaneousFat #visceralFat #water #skeletalMuscle #muscleMass #boneMass #protein #bmr #metabolicAge #fatWeight #subcuteanousFatWeight)
						collect: [ :each | each -> (self average: each) ]) ];
		column: 'Info' evaluated: [ :each | each key ];
		column: 'Value'
			evaluated: [ :each | 
			each value isNumber
				ifTrue: [ each value printShowingDecimalPlaces: 2 ]
				ifFalse: [ each value ] ];
		send: [ :result | result ]
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
