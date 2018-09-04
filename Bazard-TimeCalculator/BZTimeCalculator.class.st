Class {
	#name : #BZTimeCalculator,
	#superclass : #WAComponent,
	#instVars : [
		'main',
		'begun'
	],
	#category : 'Bazard-TimeCalculator'
}

{ #category : #'class initialization' }
BZTimeCalculator class >> initialize [
	(WAAdmin register: self asApplicationAt: 'timeCalculator')
		addLibrary: JQ2DeploymentLibrary;
		addLibrary: MDLLibrary
]

{ #category : #hooks }
BZTimeCalculator >> children [
	^ Array with: main
]

{ #category : #initialization }
BZTimeCalculator >> initialize [
	super initialize.
	main := BZTimeCalculatorMain new.
	begun := false
]

{ #category : #rendering }
BZTimeCalculator >> renderContentOn: html [
	begun
		ifTrue: [ html render: main ]
		ifFalse: [ html mdlAnchorButton
				callback: [ begun := true ];
				primaryColor;
				rippleEffect;
				raised;
				with: 'Commencer' ]
]

{ #category : #updating }
BZTimeCalculator >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot stylesheet url: (WAUrl absolute: 'https://storage.googleapis.com/code.getmdl.io/1.3.0/material.pink-teal.min.css')
]
