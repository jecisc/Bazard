Class {
	#name : #SHProject,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #SoftwareHeritage
}

{ #category : #'instance creation' }
SHProject class >> fromDictionary: aDictionary [

	^ self new
		  data: aDictionary;
		  yourself
]

{ #category : #accessing }
SHProject >> data: aDictionary [

	data := aDictionary
]

{ #category : #accessing }
SHProject >> url [

	^ data at: #url
]
