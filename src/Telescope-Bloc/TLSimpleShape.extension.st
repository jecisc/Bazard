Extension { #name : 'TLSimpleShape' }

{ #category : '*Telescope-Bloc' }
TLSimpleShape class >> asGShape [

	[
	[ ^ GPolygon vertices: self morphicPolygonPoints ]
		on: SubclassResponsibility
		do: [ TLNotSupportedFunctionalityException signal: 'This shape is not available for nodes.' ] ]
]

{ #category : '*Telescope-Bloc' }
TLSimpleShape class >> morphicPolygonPoints [

	^ self morphicPolygonPointsFrom: self polygonPoints
]

{ #category : '*Telescope-Bloc' }
TLSimpleShape class >> morphicPolygonPointsFrom: aCollectionOfPoints [
	"This method takes the polygon points representation of the shape and return a string describing the shape as morphic polygon vertices"

	"Morphic polygon does not have the same way to represent coordanates than Telescope so we convert them."

	^ aCollectionOfPoints collect: [ :point | Point x: point x y: point y negated ]
]
