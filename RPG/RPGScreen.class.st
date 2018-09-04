"
I am the screen of the game.

- window is an instance of OSWindow.
"
Class {
	#name : #RPGScreen,
	#superclass : #Object,
	#instVars : [
		'window',
		'scheduler',
		'surface',
		'model'
	],
	#category : 'RPG-GUI'
}

{ #category : #accessing }
RPGScreen class >> title [
	self flag: #todo.	"Change the title."
	^ 'RPG'
]

{ #category : #action }
RPGScreen >> close [
	window destroy.
	Transcript crShow: 'Destroy window.'.
	scheduler destroy
]

{ #category : #accessing }
RPGScreen >> eventHandler: anEventHandler [
	window eventHandler: anEventHandler
]

{ #category : #initialization }
RPGScreen >> initialize [
	super initialize.
	self newWindow.
	surface := window newAthensRenderer. 
	scheduler := RPGScheduler newFor: self
]

{ #category : #accessing }
RPGScreen >> model: anObject [
	model := anObject
]

{ #category : #initialization }
RPGScreen >> newWindow [
	| attributes |
	attributes := OSWindowAttributes new.
	attributes title: self class title.
	attributes extent: 480@352.
	attributes position: 50@50. 
	window := OSWindow createWithAttributes: attributes.
	Transcript crShow: 'Open window.'
]

{ #category : #'as yet unclassified' }
RPGScreen >> renderBackground: anAthensCairoCanvas color: aColor [ 
	self flag: #todo. "Should be in model ?"
	anAthensCairoCanvas setShape: (0@0 corner: window extent).
	anAthensCairoCanvas setPaint: (PNGReadWriter formFromFileNamed: 'ressources/background2.png').
	anAthensCairoCanvas draw
]

{ #category : #updating }
RPGScreen >> update [
	self flag: #todo. "improve! I'm naugty :3 I would be better if I update only the area that changes."
	surface athensSurface drawDuring: [ :canvas |
		model renderOn: canvas ].
	surface updateAll
]
