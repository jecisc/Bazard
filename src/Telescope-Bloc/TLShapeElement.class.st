Class {
	#name : 'TLShapeElement',
	#superclass : 'BlElement',
	#instVars : [
		'shape'
	],
	#category : 'Telescope-Bloc',
	#package : 'Telescope-Bloc'
}

{ #category : 'instance creation' }
TLShapeElement class >> fromSimpleNode: aTLSimpleNode [

	^ self new
		  adaptToStylesheet: aTLSimpleNode effectiveStyleSheet forSimpleNode: aTLSimpleNode;
		  yourself
]

{ #category : 'as yet unclassified' }
TLShapeElement >> adaptToStylesheet: aTLStyleSheet forSimpleNode: aTLSimpleNode [

	self flag: #todo. "I am not sure this should be here. Maybe we need to refactor the connector."
	aTLStyleSheet applyBlocNodeStyleFor: aTLSimpleNode on: self
]
