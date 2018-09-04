"
Executable function of SmiLang
	funcName <String> name of the function
	numArguments <Smi> 
	numTemps <Smi> (does not include arguments)
	stackSize <Smi> maximum size of stack, including temps and args 
	stackOperations <OrderedCollection of StackOperation> instructions to execute the function
	
"
Class {
	#name : #SmiFunction,
	#superclass : #Object,
	#instVars : [
		'funcName',
		'numArguments',
		'numTemps',
		'stackSize',
		'stackOperations'
	],
	#category : 'SmiLang-compiler'
}

{ #category : #accessing }
SmiFunction >> addStackOperation: op [
	stackOperations add: op
]

{ #category : #accessing }
SmiFunction >> funcName [
	^ funcName
]

{ #category : #accessing }
SmiFunction >> funcName: anObject [
	funcName := anObject
]

{ #category : #initialization }
SmiFunction >> initialize [

	super initialize.

	stackOperations := OrderedCollection new.
]

{ #category : #accessing }
SmiFunction >> numArgs [
	^ numArguments
]

{ #category : #accessing }
SmiFunction >> numArguments [
	^ numArguments
]

{ #category : #accessing }
SmiFunction >> numArguments: anObject [
	numArguments := anObject
]

{ #category : #accessing }
SmiFunction >> numTemporaries [
	^ numTemps
]

{ #category : #accessing }
SmiFunction >> numTemps [
	^ numTemps
]

{ #category : #accessing }
SmiFunction >> numTemps: anObject [
	numTemps := anObject
]

{ #category : #printing }
SmiFunction >> printOn: s [
	s << funcName.
	stackOperations withIndexDo: [ :op :index |
		s cr. 
		s tab.
		s nextPut: $<.
		s << index printString.
		s nextPut: $>.
		s space.
		op printOn: s ].
]

{ #category : #accessing }
SmiFunction >> stackOperationAt: index [
	^ stackOperations at: index
]

{ #category : #accessing }
SmiFunction >> stackOperations [
	^ stackOperations
]

{ #category : #accessing }
SmiFunction >> stackSize [
	^ stackSize
]

{ #category : #accessing }
SmiFunction >> stackSize: anObject [
	stackSize := anObject
]
