"
I am an event handler for RPG.

I have a screen model on which I can effectuate actions.
"
Class {
	#name : #RPGEventHanlder,
	#superclass : #OSWindowEventVisitor,
	#instVars : [
		'model'
	],
	#category : 'RPG-Event'
}

{ #category : #'instance creation' }
RPGEventHanlder class >> for: aRPGModel [
	^ self new
		model: aRPGModel;
		yourself
]

{ #category : #accessing }
RPGEventHanlder >> model [
	^ model
]

{ #category : #accessing }
RPGEventHanlder >> model: anObject [
	model := anObject
]

{ #category : #visiting }
RPGEventHanlder >> visitWindowCloseEvent: anEventhalt. [
	model closeGame
]
