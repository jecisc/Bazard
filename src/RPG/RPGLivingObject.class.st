"
I am an abstract object to represente every living things on the game as a character, a pnj, a monster etc...

I can have a name call instanceName (to avoid the confusion with ""name"" of the object.).
"
Class {
	#name : #RPGLivingObject,
	#superclass : #Object,
	#instVars : [
		'instanceName'
	],
	#category : 'RPG-Game'
}

{ #category : #'instance creation' }
RPGLivingObject class >> call: aName [
	^ self new
		instanceName: aName;
		yourself
]

{ #category : #'accessing - defaults' }
RPGLivingObject class >> defaultInstanceName [
	self subclassResponsibility
]

{ #category : #testing }
RPGLivingObject class >> isAbstract [
	^ self = RPGLivingObject
]

{ #category : #'as yet unclassified' }
RPGLivingObject class >> new [
	^ self isAbstract
		ifFalse: [ super new ]
		ifTrue: [ RPGGameError signal: self name , ' is an Abstract class. You can''t create a new instance.' ]
]

{ #category : #comparing }
RPGLivingObject >> = anObject [
	self flag: #todo. "test"
	self species = anObject species and: [ self instanceName = anObject instanceName ]
]

{ #category : #comparing }
RPGLivingObject >> hash [
	self flag: #todo. "test"
	self species hash bitXor: self instanceName hash
]

{ #category : #accessing }
RPGLivingObject >> instanceName [
	^ instanceName ifNil: [ self class defaultInstanceName ]
]

{ #category : #accessing }
RPGLivingObject >> instanceName: anObject [
	instanceName := anObject
]

{ #category : #testing }
RPGLivingObject >> isPlayable [
	^ false
]

{ #category : #printing }
RPGLivingObject >> printOn: aStream [
	super printOn: aStream.
	aStream << $  << $[ << self instanceName << $]
]
