"
I allow to launch a demo of the game.
"
Class {
	#name : #RPGDemo,
	#superclass : #Object,
	#category : 'RPG-Demo'
}

{ #category : #demo }
RPGDemo class >> launch [
	^ RPGModel on: RPGScreen new
]
