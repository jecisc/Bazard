"
I am an event handler for RPG.

I have a screen model on which I can effectuate actions.
"
Class {
	#name : #RPGEventHandler,
	#superclass : #OSWindowEventVisitor,
	#instVars : [
		'model'
	],
	#category : 'RPG-Event'
}

{ #category : #'instance creation' }
RPGEventHandler class >> for: aRPGModel [
	^ self new
		model: aRPGModel;
		yourself
]

{ #category : #accessing }
RPGEventHandler >> model [
	^ model
]

{ #category : #accessing }
RPGEventHandler >> model: anObject [
	model := anObject
]

{ #category : #visiting }
RPGEventHandler >> visitWindowCloseEvent: anEventhalt. [
	Transcript crShow: 'Event: close.'.
	model closeGame.
	model := nil
]
