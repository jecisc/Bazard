Class {
	#name : #SHProjectExplorerByNameOptionPresenter,
	#superclass : #SHProjectExplorerOptionPresenter,
	#instVars : [
		'textField',
		'searchButton',
		'table'
	],
	#category : #SoftwareHeritage
}

{ #category : #layout }
SHProjectExplorerByNameOptionPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: textField;
				   add: searchButton expand: false)
		  expand: false;
		  add: table;
		  yourself
]

{ #category : #initialization }
SHProjectExplorerByNameOptionPresenter >> initializePresenters [

	super initializePresenters.
	textField := self newTextInput
		             placeholder: 'Search string';
		             yourself.

	searchButton := self newButton
		                label: 'Search';
		                yourself.

	table := self newTable
]

{ #category : #initialization }
SHProjectExplorerByNameOptionPresenter >> titleForWindow [

	^ 'Search by name'
]
