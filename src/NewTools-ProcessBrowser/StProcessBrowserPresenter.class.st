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
		items: (Process allSubInstances reject: [ :each | each isTerminated ]);
		addColumn: ((SpStringTableColumn title: '????' evaluated: [ :process | 'Todo' ])
				 beSortable;
				 yourself);
		addColumn: ((SpStringTableColumn title: 'Priority' evaluated: [ :process | 1 ])
				 sortFunction: #asNumber descending;
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
