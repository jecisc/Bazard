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

{ #category : 'initialization' }
StProcessBrowserPresenter >> connectPresenters [

	super connectPresenters.

	processList transmitTo: stackList transform: [ :process | self stackForProcess: process ] postTransmission: [ :destination | destination selectFirst ].

	stackList transmitTo: codePresenter transform: [ :context |
		context
			ifNil: [ '' ]
			ifNotNil: [
				[
				codePresenter beForMethod: context method.
				context sourceCode ] onErrorDo: [ 'error getting method text' ] ] ].

	processList selectFirst
]

{ #category : 'layout' }
StProcessBrowserPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: (SpBoxLayout newTopToBottom
						    add: 'Processes list:' expand: false;
						    add: processList;
						    yourself);
				   add: (SpBoxLayout newTopToBottom
						    add: 'Stack of selected process:' expand: false;
						    add: stackList;
						    yourself);
				   yourself);
		  add: codePresenter;
		  yourself
]

{ #category : 'initialization' }
StProcessBrowserPresenter >> initializePresenters [

	super initializePresenters.

	processList := self newTable.
	stackList := self newList.
	codePresenter := self newCode.

	processList
		items: (Process allSubInstances reject: [ :process | process isTerminated ]);
		sortingBlock: #priority descending;
		addColumn: ((SpStringTableColumn title: 'Name' evaluated: [ :process | process name ])
				 beSortable;
				 yourself);
		addColumn: ((SpStringTableColumn title: 'Priority' evaluated: [ :process | process priority ])
				 sortFunction: #priority descending;
				 width: 100;
				 yourself)
]

{ #category : 'initialization' }
StProcessBrowserPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter 
		title: 'Process Browser';
		initialExtent: 1000@600
]

{ #category : 'accessing - model' }
StProcessBrowserPresenter >> selectedContext [
	^ stackList selectedItem
]

{ #category : 'accessing' }
StProcessBrowserPresenter >> stackForProcess: process [

	^ process == Processor activeProcess
		  ifTrue: [ thisContext stack ]
		  ifFalse: [ process suspendedContext ifNotNil: [ :context | context stack ] ]
]
