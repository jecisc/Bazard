"
I am an abstract class to represent every playble character of the game. 
"
Class {
	#name : #RPGPlayableCharacter,
	#superclass : #RPGLivingObject,
	#category : 'RPG-Game'
}

{ #category : #testing }
RPGPlayableCharacter class >> isAbstract [
	^ self = RPGPlayableCharacter
]

{ #category : #testing }
RPGPlayableCharacter >> isPlayable [
	^ true
]
