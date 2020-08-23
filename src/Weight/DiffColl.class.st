Class {
	#name : #DiffColl,
	#superclass : #Object,
	#instVars : [
		'weeklyDiffs'
	],
	#category : #Weight
}

{ #category : #accessing }
DiffColl class >> launch [
	<script>
	| weights weekly |
	weights := FileLocator downloads / 'Renpho-C.csv'
		readStreamDo: [ :s | 
			(NeoCSVReader on: s)
				skipHeader;
				recordClass: DailyWeight;
				addField: #date: converter: [ :date | DateAndTime fromString: date ];
				addFloatField: #weight:;
				addFloatField: #bmi:;
				addFloatField: #fat:;
				addFloatField: #fatFree:;
				addFloatField: #subcutaneousFat:;
				addIntegerField: #visceralFat:;
				addFloatField: #water:;
				addFloatField: #skeletalMuscle:;
				addFloatField: #muscleMass:;
				addFloatField: #boneMass:;
				addFloatField: #protein:;
				addFloatField: #bmr:;
				addIntegerField: #metabolicAge:;
				upToEnd ].

	weights := weights reject: [ :w | w fat isNil ].
	weights := (weights groupedBy: [ :e | e date day ]) values collect: #last.

	weekly := OrderedCollection new.
	(weights groupedBy: [ :e | e date asWeek ])
		keysAndValuesDo: [ :date :weeks | 
			weekly
				add:
					(WeeklyWeight new
						week: date;
						weights: weeks;
						yourself) ].
	weekly sorted: #week ascending.

	DiffColl new
		weeklyDiffs:
			(weekly
				overlappingPairsCollect: [ :a :b | 
					WeeklyDiff new
						week1: b;
						week2: a;
						yourself ]);
		inspect
]

{ #category : #'as yet unclassified' }
DiffColl >> gtInspectorIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite fastTable
		title: 'Diff';
		display: [ :aCollection | 
			((weeklyDiffs sort: [ :e | e week2 week ] ascending)
				add:
					(WeeklyDiff new
						week1: weeklyDiffs first week1;
						week2: weeklyDiffs last week2;
						yourself);
				yourself)
				collect: [ :week | 
					{week weekPrinting}
						,
							(#(#weight #bmi #fat #fatFree #subcutaneousFat #visceralFat #water #skeletalMuscle #muscleMass #boneMass #protein #bmr #metabolicAge #fatWeight #subcuteanousFatWeight)
								collect: [ :each | week diffFor: each ]) ] ];
		column: 'Date' evaluated: [ :each | each at: 1 ];
		column: 'Weight' evaluated: [ :e | (e at: 2) printShowingDecimalPlaces: 2 ] width: 100;
		column: 'Bmi' evaluated: [ :e | (e at: 3) printShowingDecimalPlaces: 2 ] width: 100;
		column: 'Fat' evaluated: [ :e | (e at: 4) printShowingDecimalPlaces: 2 ] width: 100;
		column: 'FatFree' evaluated: [ :e | (e at: 5) printShowingDecimalPlaces: 2 ] width: 100;
		column: 'SubcutaneousFat' evaluated: [ :e | (e at: 6) printShowingDecimalPlaces: 2 ] width: 100;
		column: 'VisceralFat' evaluated: [ :e | (e at: 7) printShowingDecimalPlaces: 2 ] width: 100;
		column: 'Water' evaluated: [ :e | (e at: 8) printShowingDecimalPlaces: 2 ] width: 100;
		column: 'SkeletalMuscle' evaluated: [ :e | (e at: 9) printShowingDecimalPlaces: 2 ] width: 100;
		column: 'MuscleMass' evaluated: [ :e | (e at: 10) printShowingDecimalPlaces: 2 ] width: 100;
		column: 'BoneMass' evaluated: [ :e | (e at: 11) printShowingDecimalPlaces: 2 ] width: 100;
		column: 'Protein' evaluated: [ :e | (e at: 12) printShowingDecimalPlaces: 2 ] width: 100;
		column: 'Bmr' evaluated: [ :e | (e at: 13) printShowingDecimalPlaces: 2 ] width: 100;
		column: 'MetabolicAge' evaluated: [ :e | (e at: 14) printShowingDecimalPlaces: 2 ] width: 100;
		column: 'FatWeight' evaluated: [ :e | (e at: 15) printShowingDecimalPlaces: 2 ] width: 100;
		column: 'SubcFatWeight' evaluated: [ :e | (e at: 16) printShowingDecimalPlaces: 2 ] width: 100;
		send: [ :result | result ]
]

{ #category : #accessing }
DiffColl >> weeklyDiffs [
	^ weeklyDiffs
]

{ #category : #accessing }
DiffColl >> weeklyDiffs: anObject [
	weeklyDiffs := anObject
]
