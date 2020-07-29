Class {
	#name : #DailyWeight,
	#superclass : #Object,
	#instVars : [
		'date',
		'weight',
		'bmi',
		'fat',
		'fatFree',
		'subcutaneousFat',
		'visceralFat',
		'water',
		'skeletalMuscle',
		'boneMass',
		'muscleMass',
		'protein',
		'bmr',
		'metabolicAge'
	],
	#category : #Weight
}

{ #category : #accessing }
DailyWeight >> bmi [
	^ bmi
]

{ #category : #accessing }
DailyWeight >> bmi: anObject [
	bmi := anObject
]

{ #category : #accessing }
DailyWeight >> bmr [
	^ bmr
]

{ #category : #accessing }
DailyWeight >> bmr: anObject [
	bmr := anObject
]

{ #category : #accessing }
DailyWeight >> boneMass [
	^ boneMass
]

{ #category : #accessing }
DailyWeight >> boneMass: anObject [
	boneMass := anObject
]

{ #category : #accessing }
DailyWeight >> date [
	^ date
]

{ #category : #accessing }
DailyWeight >> date: anObject [
	date := anObject
]

{ #category : #accessing }
DailyWeight >> fat [
	^ fat
]

{ #category : #accessing }
DailyWeight >> fat: anObject [
	fat := anObject
]

{ #category : #accessing }
DailyWeight >> fatFree [
	^ fatFree
]

{ #category : #accessing }
DailyWeight >> fatFree: anObject [
	fatFree := anObject
]

{ #category : #accessing }
DailyWeight >> fatWeight [
	^ self weight / 100 * self fat
]

{ #category : #accessing }
DailyWeight >> metabolicAge [
	^ metabolicAge
]

{ #category : #accessing }
DailyWeight >> metabolicAge: anObject [
	metabolicAge := anObject
]

{ #category : #accessing }
DailyWeight >> muscleMass [
	^ muscleMass
]

{ #category : #accessing }
DailyWeight >> muscleMass: anObject [
	muscleMass := anObject
]

{ #category : #printing }
DailyWeight >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		print: self date;
		nextPut: $)
]

{ #category : #accessing }
DailyWeight >> protein [
	^ protein
]

{ #category : #accessing }
DailyWeight >> protein: anObject [
	protein := anObject
]

{ #category : #accessing }
DailyWeight >> skeletalMuscle [
	^ skeletalMuscle
]

{ #category : #accessing }
DailyWeight >> skeletalMuscle: anObject [
	skeletalMuscle := anObject
]

{ #category : #accessing }
DailyWeight >> subcutaneousFat [
	^ subcutaneousFat
]

{ #category : #accessing }
DailyWeight >> subcutaneousFat: anObject [
	subcutaneousFat := anObject
]

{ #category : #accessing }
DailyWeight >> subcuteanousFatWeight [
	^ self weight / 100 * self subcutaneousFat
]

{ #category : #accessing }
DailyWeight >> visceralFat [
	^ visceralFat
]

{ #category : #accessing }
DailyWeight >> visceralFat: anObject [
	visceralFat := anObject
]

{ #category : #accessing }
DailyWeight >> water [
	^ water
]

{ #category : #accessing }
DailyWeight >> water: anObject [
	water := anObject
]

{ #category : #accessing }
DailyWeight >> weight [
	^ weight
]

{ #category : #accessing }
DailyWeight >> weight: anObject [
	weight := anObject
]
