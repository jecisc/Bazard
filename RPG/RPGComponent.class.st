"
I am a component for a view of the game. Components can be a composite.
A RPGModel is juste a RPGComponent base on a composition of components.

I can be render on an Athens surface via the renderOn: method.
"
Class {
	#name : #RPGComponent,
	#superclass : #Object,
	#category : 'RPG-GUI'
}

{ #category : #testing }
RPGComponent class >> isAbstract [
	^ self = RPGComponent
]

{ #category : #rendering }
RPGComponent >> renderOn: anAthensCairoCanvas [
	self subclassResponsibility 
]
