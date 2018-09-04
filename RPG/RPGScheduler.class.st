"
I am a scheduler that update the screen surface.
"
Class {
	#name : #RPGScheduler,
	#superclass : #Object,
	#instVars : [
		'screen',
		'process'
	],
	#category : 'RPG-GUI'
}

{ #category : #'instance creation' }
RPGScheduler class >> newFor: aScreen [
	^ self basicNew
		screen: aScreen;
		initialize;
		yourself
]

{ #category : #initialization }
RPGScheduler >> destroy [
	[ process terminate ] on: Error do: [:e | Transcript crShow: e message ].
	Transcript crShow: 'Process end.'.
	process := nil.
	screen := nil
]

{ #category : #constants }
RPGScheduler >> fps [
	self flag: #todo. "Should not be hardcode."
	self flag: #todo. "Should be configurable."
	^ 30
]

{ #category : #initialization }
RPGScheduler >> initialize [
	super initialize.
	Transcript crShow: 'Process begin.'.
	process := self newProcessAt: 30 do: [ screen update ] every: self timeBetweenRendering
]

{ #category : #'instance creation' }
RPGScheduler >> newProcessAt: priority do: aBlock every: duration [
	^ [ 
		[ | time delay |
		time := DateAndTime now.
		aBlock value.
		delay := duration - (DateAndTime now - time).
		delay negative 
			ifFalse: [ delay wait ]
			ifTrue: [ "slowing process" ]
		 ] repeat ] forkAt: priority
]

{ #category : #accessing }
RPGScheduler >> screen [
	^ screen ifNil: [ RPGScreenError signal: 'This scheduler should always have a screen.' ]
]

{ #category : #accessing }
RPGScheduler >> screen: aRPGScreen [ 
	screen := aRPGScreen
]

{ #category : #constants }
RPGScheduler >> timeBetweenRendering [
	^ (1000 / self fps ) milliSeconds
]
