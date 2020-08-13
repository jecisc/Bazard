Class {
	#name : #IcebergScripts,
	#superclass : #Object,
	#category : #Scripts
}

{ #category : #removing }
IcebergScripts class >> removePackagesFromIcebergRepository [
	(IceRepository registry detect: [ :e | e name = 'MyProject' ]) workingCopy packages
		select: [ :p | p name includesSubstring: 'SubString' ]
		thenDo: #remove
]

{ #category : #'see class side' }
IcebergScripts >> seeClassSide [
]
