Class {
	#name : 'StProcessBrowserPresenter',
	#superclass : 'StPresenter',
	#instVars : [
		'processList',
		'stackList',
		'codePresenter'
	],
	#category : 'NewTools-ProcessBrowser',
	#package : 'NewTools-ProcessBrowser'
}

{ #category : 'instance creation' }
StProcessBrowserPresenter class >> open [

	<script>
	Smalltalk garbageCollect.
	^ self new open
]

{ #category : 'layout' }
StProcessBrowserPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: processList;
				   add: stackList);
		  add: codePresenter;
		  yourself
]

{ #category : 'initialization' }
StProcessBrowserPresenter >> initializePresenters [

	super initializePresenters.

	processList := self newList.
	stackList := self newList.
	codePresenter := self newCode
]

{ #category : 'initialization' }
StProcessBrowserPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter 
		title: 'Process Browser';
		initialExtent: 800@500
]
