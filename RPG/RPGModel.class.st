"
I am a composition of components that represent a model to display on a screen.
"
Class {
	#name : #RPGModel,
	#superclass : #RPGComponent,
	#instVars : [
		'screen'
	],
	#category : 'RPG-GUI'
}

{ #category : #'instance creation' }
RPGModel class >> on: aScreen [
	^ self new
		screen: aScreen;
		display;
		yourself
]

{ #category : #accessing }
RPGModel >> backgroundColor [
	^ Color black
]

{ #category : #'screen action' }
RPGModel >> closeGame [
	screen close.
	screen := nil
]

{ #category : #display }
RPGModel >> display [
	screen eventHandler: self newEventHandler.
	screen model: self
]

{ #category : #accessing }
RPGModel >> newEventHandler [
	^ RPGEventHandler for: self
]

{ #category : #rendering }
RPGModel >> renderModelOn: anAthensCairoCanvas [ 
	self flag: #todo. 
]

{ #category : #rendering }
RPGModel >> renderOn: anAthensCairoCanvas [ 
	screen renderBackground: anAthensCairoCanvas color: self backgroundColor.
	self renderModelOn: anAthensCairoCanvas
]

{ #category : #accessing }
RPGModel >> screen [
	^ screen
]

{ #category : #accessing }
RPGModel >> screen: anObject [
	screen := anObject
]
