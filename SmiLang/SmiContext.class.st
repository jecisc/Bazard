"
Represent the activation of a SmiFunction
	function:		<SmiFunction>
	programCounter:		<Smi> index in function stackOperation of the operation being executed
	sender:		<SmiContext | nil> nil for top most context, else the context that activated this one (context to return to)
	stack:		<Array> its size depends on the function stackSize
	stackPointer:		<Smi> top of stack in the inst var stack


"
Class {
	#name : #SmiContext,
	#superclass : #Object,
	#instVars : [
		'sender',
		'programCounter',
		'function',
		'stack',
		'stackPointer'
	],
	#category : 'SmiLang-context interpreter'
}

{ #category : #accessing }
SmiContext >> function [
	^ function
]

{ #category : #accessing }
SmiContext >> function: anObject [
	function := anObject
]

{ #category : #initialization }
SmiContext >> initialContext [
	stackPointer := 0.
	stack := { 0 }.
]

{ #category : #initialization }
SmiContext >> initializeWithFunc: func [
	function := func.
	stack := Array new: func stackSize.
	stack atAllPut: 0.
	stackPointer := 0
]

{ #category : #stack }
SmiContext >> pop [
	stackPointer := stackPointer - 1.
	^ stack at: stackPointer + 1
]

{ #category : #accessing }
SmiContext >> programCounter [
	^ programCounter
]

{ #category : #accessing }
SmiContext >> programCounter: anObject [
	programCounter := anObject
]

{ #category : #stack }
SmiContext >> push: elem [
	Halt if: [ elem isKindOf: SmiPushTemp ].
	stack at: (stackPointer := stackPointer + 1) put: elem
]

{ #category : #accessing }
SmiContext >> sender [
	^ sender
]

{ #category : #accessing }
SmiContext >> sender: anObject [
	sender := anObject
]

{ #category : #stack }
SmiContext >> stackAt: index [ 	
	^ stack at: index
]

{ #category : #stack }
SmiContext >> stackAt: index put: value [
	^ stack at: index put: value
]

{ #category : #accessing }
SmiContext >> stackPointer [
	^ stackPointer
]

{ #category : #accessing }
SmiContext >> stackPointer: anObject [
	stackPointer := anObject
]

{ #category : #stack }
SmiContext >> top [
	^ stack at: stackPointer
]
