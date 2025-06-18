Class {
	#name : 'FamixCallGraphNode',
	#superclass : 'Object',
	#instVars : [
		'methodName',
		'kind',
		'realMethod'
	],
	#category : 'Famix-CallGraph',
	#package : 'Famix-CallGraph'
}

{ #category : 'as yet unclassified' }
FamixCallGraphNode class >> methodName: aString kind: aFamixType [

	^ self new
		  methodName: aString;
		  kind: aFamixType;
		  yourself
]

{ #category : 'accessing' }
FamixCallGraphNode >> kind [

	^ kind
]

{ #category : 'accessing' }
FamixCallGraphNode >> kind: anObject [

	kind := anObject
]

{ #category : 'accessing' }
FamixCallGraphNode >> methodName [

	^ methodName
]

{ #category : 'accessing' }
FamixCallGraphNode >> methodName: anObject [

	methodName := anObject
]

{ #category : 'accessing' }
FamixCallGraphNode >> realMethod [

	^ realMethod
]

{ #category : 'accessing' }
FamixCallGraphNode >> realMethod: anObject [

	realMethod := anObject
]
