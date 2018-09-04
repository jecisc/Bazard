"
Interprets SmiFunction using contexts.

	currentContext <SmiContext> Context being executed
"
Class {
	#name : #SmiContextInterpreter,
	#superclass : #Object,
	#instVars : [
		'currentContext'
	],
	#category : 'SmiLang-context interpreter'
}

{ #category : #private }
SmiContextInterpreter >> initialContext [
	^ SmiContext new
		programCounter: 0;
		function: #stopFlag;
		initialContext;
		yourself
]

{ #category : #private }
SmiContextInterpreter >> interpret [
	[ currentContext function == #stopFlag ] whileFalse: [ 
		currentContext programCounter: currentContext programCounter + 1. 
		self interpretNextInstruction ]
]

{ #category : #public }
SmiContextInterpreter >> interpret: function [
	currentContext := self initialContext.
	self newContextFor: function.
	self interpret.
	^ currentContext top
]

{ #category : #private }
SmiContextInterpreter >> interpretNextInstruction [
	"should ask the current instruction to 'accept: self' to dispatch"

	(currentContext function stackOperationAt: currentContext programCounter) accept: self.
	Halt onCount: 1000	"You may use this code to halt on infinite loops"
]

{ #category : #private }
SmiContextInterpreter >> newContextFor: function [
	| nextContext arguments |
	nextContext := SmiContext new
		initializeWithFunc: function;
		programCounter: 0;
		sender: currentContext;
		yourself.
	arguments := Array new: function numArguments.
	1 to: arguments size do: [ :i | arguments at: arguments size - i + 1 put: currentContext pop ].
	currentContext := nextContext.
	arguments do: [ :arg | currentContext push: arg ].
	1 to: function numTemps do: [ :ind | currentContext push: 0 ]

	"should set up a new currentContext:
	sender
	stack and stackPointer
	arguments and temporaries"
]

{ #category : #visiting }
SmiContextInterpreter >> visitCallFunction: node [
	"should call newContextFor:"

	self newContextFor: node function
]

{ #category : #visiting }
SmiContextInterpreter >> visitPop: node [
	currentContext pop
]

{ #category : #visiting }
SmiContextInterpreter >> visitPrimitiveOperation: node [
	"Use perform:with: to get the primitive result"

	| arg receiver |
	arg := currentContext pop.
	receiver := currentContext pop.
	currentContext push: (receiver perform: node selector with: arg)
]

{ #category : #visiting }
SmiContextInterpreter >> visitPushSmi: node [
	currentContext push: node smi
]

{ #category : #visiting }
SmiContextInterpreter >> visitPushTemp: node [
	"Fetches the value from the stack based on node tempIndex"

	currentContext push: (currentContext stackAt: node tempIndex)
]

{ #category : #visiting }
SmiContextInterpreter >> visitReturnTop: node [
	"Push the top of the stack on the currentContext sender stack
	and resume execution in the sender."
	
	| value |
	value := currentContext top.
	currentContext := currentContext sender.
	currentContext push: value
]

{ #category : #visiting }
SmiContextInterpreter >> visitStoreTemp: node [
	"There should be a location on stack to store this value"

	currentContext stackAt: node tempIndex put: currentContext top
]
