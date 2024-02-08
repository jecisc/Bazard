Extension { #name : 'TLSimpleNode' }

{ #category : '*Telescope-Bloc' }
TLSimpleNode >> asBlocNode [

	^ TLShapeElement fromSimpleNode: self
]
