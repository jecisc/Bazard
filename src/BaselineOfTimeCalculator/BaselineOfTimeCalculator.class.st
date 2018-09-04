Class {
	#name : #BaselineOfTimeCalculator,
	#superclass : #BaselineOf,
	#category : 'BaselineOfTimeCalculator'
}

{ #category : #baseline }
BaselineOfTimeCalculator >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self material: spec.
			spec package: 'Bazard-TimeCalculator' with: [ spec requires: #('MaterialDesignLite') ] ]
]

{ #category : #dependencies }
BaselineOfTimeCalculator >> material: spec [
	spec
		baseline: 'MaterialDesignLite'
		with: [ spec repository: 'github://DuneSt/MaterialDesignLite:development/src' ]
]
