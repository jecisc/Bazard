"
I am a composite that describe how to render components in a row.

components is a list of components that I need to render.
"
Class {
	#name : #RPGRowCompositeComponent,
	#superclass : #RPGComponent,
	#instVars : [
		'components'
	],
	#category : 'RPG-GUI'
}

{ #category : #'instance-creation' }
RPGRowCompositeComponent class >> withAllComponents: components [
	^ self new
		components: components;
		yourself
]

{ #category : #accessors }
RPGRowCompositeComponent >> components [
	^ components ifNil: [ {} ]
]

{ #category : #accessors }
RPGRowCompositeComponent >> components: aCollectionOfComponents [
	components := aCollectionOfComponents
]

{ #category : #rendering }
RPGRowCompositeComponent >> renderOn: anAthensCairoCanvas [
	| space |
	self flag: #todo. "better handling of the space."
	space := 0.
	components do: [ :w | 
		w renderOn: anAthensCairoCanvas.
		anAthensCairoCanvas pathTransform translateX: space Y: 0 ].
	anAthensCairoCanvas pathTransform translateX: (space * components size negated) Y: 0.
]
