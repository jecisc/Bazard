Class {
	#name : #NSGrid,
	#superclass : #Object,
	#instVars : [
		'content'
	],
	#category : #NonogramSolver
}

{ #category : #'instance creation' }
NSGrid class >> width: anInteger height: anInteger2 [ 
	^ self new
		width: anInteger height: anInteger2;
		yourself
]

{ #category : #initialization }
NSGrid >> width: anInteger height: anInteger2 [ 
	content := Array new: anInteger.
	1 to: anInteger do: [ :index | content at: index put: (Array new: anInteger2) ]
]
