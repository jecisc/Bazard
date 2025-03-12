Class {
	#name : 'Tricky',
	#superclass : 'Object',
	#instVars : [
		'var'
	],
	#category : 'HardToDebug',
	#package : 'HardToDebug'
}

{ #category : 'initialization' }
Tricky >> initialize [

	super initialize.
	var := #(  )
]

{ #category : 'printing' }
Tricky >> printOn: aStream [

	var
		ifNil: [ super printOn: aStream ]
		ifNotNil: [ [ true ] whileTrue ]
]
