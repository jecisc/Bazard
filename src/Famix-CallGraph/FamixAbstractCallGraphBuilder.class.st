Class {
	#name : 'FamixAbstractCallGraphBuilder',
	#superclass : 'Object',
	#instVars : [
		'graph',
		'entryPoints'
	],
	#category : 'Famix-CallGraph',
	#package : 'Famix-CallGraph'
}

{ #category : 'accessing' }
FamixAbstractCallGraphBuilder class >> entryPoint: aMethod [

	^ self entryPoints: { aMethod }
]

{ #category : 'accessing' }
FamixAbstractCallGraphBuilder class >> entryPoints: aCollection [

	^ self new
		  entryPoints: aCollection;
		  yourself
]

{ #category : 'building' }
FamixAbstractCallGraphBuilder >> build [

	self subclassResponsibility
]

{ #category : 'accessing' }
FamixAbstractCallGraphBuilder >> entryPoints [

	^ entryPoints
]

{ #category : 'accessing' }
FamixAbstractCallGraphBuilder >> entryPoints: aCollection [

	entryPoints := aCollection collect: [ :method |
			               method isMooseObject
				               ifTrue: [ method asCallGraphNode ]
				               ifFalse: [ method ] ]
]

{ #category : 'accessing' }
FamixAbstractCallGraphBuilder >> graph [

	^ graph
]

{ #category : 'accessing' }
FamixAbstractCallGraphBuilder >> graph: anObject [

	graph := anObject
]

{ #category : 'initialization' }
FamixAbstractCallGraphBuilder >> initialize [
	super initialize.
	graph := OrderedDictionary new
]
