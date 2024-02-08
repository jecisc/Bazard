Extension { #name : 'TLDemos' }

{ #category : '*Telescope-Bloc' }
TLDemos class >> exampleAAABloc [
	<script: 'self exampleAAABloc open'>
	<tlFilter: #style>
	| visualization |
	self flag: #todo. "This is a temporary demo to dev Monphic connector"
	visualization := TLVisualization new.
	visualization styleSheet
		width: 40;
		height: 40;
		nodeLabel: #displayName;
		shape: #yourself.
	visualization layout: (TLLinearLayout gap: 50 ratio: 16/9).
	visualization legend nodeShapeDescription: #displayName forNodes: [ visualization obtain recursively nodes ].
	visualization addNodesFromEntities: visualization generator nodesShapesAvailableForConnector.
	30 timesRepeat: [ visualization nodes atRandom connectIfNotTo: visualization nodes atRandom ].
	^ visualization
]
