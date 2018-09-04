"
An AbstractClassXTest is a test class for testing the behavior of AbstractClassX
"
Class {
	#name : #AbstractClassXTest,
	#superclass : #TestCase,
	#instVars : [
		'instance'
	],
	#category : 'SUnit-Example-Abstract'
}

{ #category : #testing }
AbstractClassXTest class >> isAbstract [
	^ self = AbstractClassXTest 
]

{ #category : #accessing }
AbstractClassXTest >> actualClass [
	^ self subclassResponsibility 
]

{ #category : #'instance creation' }
AbstractClassXTest >> newInstance [
	^ self actualClass new
]

{ #category : #initialization }
AbstractClassXTest >> setUp [
	super setUp.
	instance := self newInstance 
]

{ #category : #tests }
AbstractClassXTest >> testFactForClass [
	self assert: instance factForClass equals: instance anInt factorial
]
