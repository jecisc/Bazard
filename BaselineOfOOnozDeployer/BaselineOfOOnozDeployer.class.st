Class {
	#name : #BaselineOfOOnozDeployer,
	#superclass : #BaselineOf,
	#category : 'BaselineOfOOnozDeployer'
}

{ #category : #baselines }
BaselineOfOOnozDeployer >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self seaside3: spec.
			spec package: 'OOnozDeployer' with: [ spec requires: #('Seaside3') ] ]
]

{ #category : #accessing }
BaselineOfOOnozDeployer >> projectClass [
	self flag: #clean.	"This is a hack that need to be remove after the default version of Metacello includes Cypress suport."
	^ [ self class environment at: #MetacelloCypressBaselineProject ]
		on: NotFound
		do: [ Metacello new
				baseline: 'Metacello';
				repository: 'github://dalehenrich/metacello-work:master/repository';
				get.
			Metacello new
				baseline: 'Metacello';
				repository: 'github://dalehenrich/metacello-work:master/repository';
				onConflict: [ :ex | ex allow ];
				load.
			self projectClass ]
]

{ #category : #dependencies }
BaselineOfOOnozDeployer >> seaside3: spec [
	spec
		configuration: 'Seaside3'
		with: [ spec
				version: #'release3.2';
				repository: 'http://smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ]
]
