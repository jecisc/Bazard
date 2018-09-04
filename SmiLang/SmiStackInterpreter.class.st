"
Interpret using a theoretically infinite stackPage the SmiFunctions
	
	programCounter <Smi> index in currentFunction stackOperations of the operation being executed
	currentFunction <SmiFunction> function being executed
	framePointer <Smi> index in the stack page of the active framePointer 
	stackPointer <Smi> index in the stack page of the active stack pointerArity 	currentStackPage <Array> theoritacally infinite stack page
"
Class {
	#name : #SmiStackInterpreter,
	#superclass : #Object,
	#instVars : [
		'programCounter',
		'currentFunction',
		'framePointer',
		'stackPointer',
		'currentStackPage'
	],
	#category : 'SmiLang-stack interpreter'
}

{ #category : #private }
SmiStackInterpreter >> activateFunction: func [
	"Sets up a new stack frame:
	push and update function, programCounter, framePointer and allocate space for temporaries"

	self push: currentFunction.
	currentFunction := func.
	self push: programCounter.
	programCounter := 0.
	self push: framePointer.
	framePointer := stackPointer.
	func numTemporaries timesRepeat: [ self push: 0 ]
]

{ #category : #initialization }
SmiStackInterpreter >> initialize [

	super initialize.

	currentStackPage := self newStackPage.
	stackPointer := 0.
]

{ #category : #initialization }
SmiStackInterpreter >> initializeStackFor: function [
	programCounter := #programCounterFlag.
	currentFunction := #functionFlag.
	framePointer := #framePointerFlag.
	self activateFunction: function
]

{ #category : #private }
SmiStackInterpreter >> interpret [
	[ currentFunction == #functionFlag ]
		whileFalse: [ programCounter := programCounter + 1.
			self interpretNextInstruction ]
]

{ #category : #public }
SmiStackInterpreter >> interpret: function [
	self initializeStackFor: function.
	self interpret.
	^ currentStackPage first
]

{ #category : #private }
SmiStackInterpreter >> interpretNextInstruction [
	"Asks the currentInstruction to accept self"

	(currentFunction stackOperationAt: programCounter) accept: self.
	Halt onCount: 1000	"You may use this code to halt on infinite loops"
]

{ #category : #initialization }
SmiStackInterpreter >> newStackPage [
	^ Array new: self stackPageSize
]

{ #category : #stack }
SmiStackInterpreter >> pop [
	"should pop top of stack and return it"

	| res |
	
	res := currentStackPage at: stackPointer.
	currentStackPage at: stackPointer put: nil.
	stackPointer := stackPointer - 1.
	^ res
]

{ #category : #stack }
SmiStackInterpreter >> push: elem [
	"should push elem on top of stack"
	
	stackPointer := stackPointer + 1.
	currentStackPage at: stackPointer put: elem
]

{ #category : #initialization }
SmiStackInterpreter >> stackPageSize [
	^ 50
]

{ #category : #stack }
SmiStackInterpreter >> top [
	"should answer top of stack"
	
	^ currentStackPage at: stackPointer 
]

{ #category : #visiting }
SmiStackInterpreter >> visitCallFunction: node [
	"probably calls activateFunction:"
	
	self activateFunction: node function 
]

{ #category : #visiting }
SmiStackInterpreter >> visitPop: node [
	self pop
]

{ #category : #visiting }
SmiStackInterpreter >> visitPrimitiveOperation: node [
	"Use perform:with: to get the primitive result"

	| arg rec |
	arg := self pop.
	rec := self pop.
	self push: (rec perform: node selector with: arg)
]

{ #category : #visiting }
SmiStackInterpreter >> visitPushSmi: node [
	self push: node smi
]

{ #category : #visiting }
SmiStackInterpreter >> visitPushTemp: node [
	"Pushes the temp value relatively to the frame pointer.
	Depending if the index corresponds to an argument or a temporary,
	fetches the value before or after the framePointer"

	node tempIndex <= currentFunction numArgs
		ifFalse: [ self push: (currentStackPage at: framePointer - currentFunction numArgs + node tempIndex) ]
		ifTrue: [ self push: (currentStackPage at: framePointer - 3 - currentFunction numArgs + node tempIndex) ]
]

{ #category : #visiting }
SmiStackInterpreter >> visitReturnTop: node [
	"Pop the current frame and push the function result.
	Restores programCounter, currentFunction and framePointer to sender frame"

	| res |
	res := self top.
	stackPointer := framePointer - 3 + currentFunction numArgs.
	programCounter := currentStackPage at: framePointer - 1.
	currentFunction := currentStackPage at: framePointer - 2.
	framePointer := currentStackPage at: framePointer.
	self push: res
]

{ #category : #visiting }
SmiStackInterpreter >> visitStoreTemp: node [
	"the temp referenced is necessarily a temporary and not an argument (language constraint).
	Store the top of stack relatively to a location relative to the framePointer.
	Does not pop the stack (stack pointer is the same at the end of this instruction than at the beginning)"

	currentStackPage at: framePointer + node tempIndex put: self top
]
