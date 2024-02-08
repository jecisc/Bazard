Class {
	#name : 'TLBlocConnector',
	#superclass : 'TLConnector',
	#category : 'Telescope-Bloc-Connector',
	#package : 'Telescope-Bloc-Connector'
}

{ #category : 'accessing' }
TLBlocConnector class >> priority [

	^ 1000
]

{ #category : 'generation - node' }
TLBlocConnector >> createElementNodeFromNode: aNode [

	| styleSheet |
	self flag: #todo.
	styleSheet := aNode effectiveStyleSheet.
	aNode asBlocNode
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

	aTLVisualization generateWith: self.
	aSpace
]
