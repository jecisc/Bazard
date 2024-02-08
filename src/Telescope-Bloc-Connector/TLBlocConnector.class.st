Class {
	#name : 'TLBlocConnector',
	#superclass : 'TLViewConnector',
	#category : 'Telescope-Bloc-Connector',
	#package : 'Telescope-Bloc-Connector'
}

{ #category : 'accessing' }
TLBlocConnector class >> priority [

	^ 1000
]

{ #category : 'view' }
TLBlocConnector >> addElementNodeInView: element [

	self view root addChild: element.

	self flag: #todo
	"To make the code easier the label is not a submorph of the node morph but the submorph store it. We need to say to the node morph to add it into the view if it exists"
	"element morph addLabelToVisualization"
]

{ #category : 'generation - node' }
TLBlocConnector >> createElementNodeFromNode: aNode [

	| styleSheet |
	self flag: #todo.
	styleSheet := aNode effectiveStyleSheet.
	^ aNode asBlocNode
]

{ #category : 'accessing' }
TLBlocConnector >> nodesShapesAvailableForConnector [

	^ TLSimpleShape allSubclasses select: [ :class |
		  [
		  class asGShape.
		  true ]
			  on: TLNotSupportedFunctionalityException
			  do: [ false ] ]
]

{ #category : 'opening' }
TLBlocConnector >> open: aTLVisualization inWindowSized: aPoint titled: aString [

	| aSpace |
	aSpace := BlSpace new.
	aSpace show.
	"Edit the space's properties, like title and size"
	aSpace title: aString.
	aSpace extent: aPoint.
	
	self view: aSpace.

	aTLVisualization generateWith: self.
	aSpace
]
