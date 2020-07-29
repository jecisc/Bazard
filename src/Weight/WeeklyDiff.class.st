Class {
	#name : #WeeklyDiff,
	#superclass : #Object,
	#instVars : [
		'week1',
		'week2'
	],
	#category : #Weight
}

{ #category : #accessing }
WeeklyDiff >> diffFor: aSymbol [
	^ (self week2 average: aSymbol) - (self week1 average: aSymbol)
]

{ #category : #'as yet unclassified' }
WeeklyDiff >> gtInspectorIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite fastTable
		title: 'Diff';
		display: [ :aCollection | 
			{('Date' -> self weekPrinting)}
				,
					(#(#weight #bmi #fat #fatFree #subcutaneousFat #visceralFat #water #skeletalMuscle #muscleMass #boneMass #protein #bmr #metabolicAge #fatWeight #subcuteanousFatWeight)
						collect: [ :each | each -> (self diffFor: each) ]) ];
		column: 'Info' evaluated: [ :each | each key ];
		column: 'Diff'
			evaluated: [ :each | 
			each value isNumber
				ifTrue: [ each value printShowingDecimalPlaces: 2 ]
				ifFalse: [ each value ] ];
		send: [ :result | result ]
]

{ #category : #accessing }
WeeklyDiff >> week1 [
	^ week1
]

{ #category : #accessing }
WeeklyDiff >> week1: anObject [
	week1 := anObject
]

{ #category : #accessing }
WeeklyDiff >> week2 [
	^ week2
]

{ #category : #accessing }
WeeklyDiff >> week2: anObject [
	week2 := anObject
]

{ #category : #printing }
WeeklyDiff >> weekPrinting [
	^ week2 weekPrinting
]
