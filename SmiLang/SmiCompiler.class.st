"
SmiCompiler compiles SmiLang function to SmiFunction
	<func> SmiFunction being compiled
	<tempNames> used to map tempNames to temp indexes 
	<stackSize> current stack depth 
	<maxStackSize> maximum size of the stack used
"
Class {
	#name : #SmiCompiler,
	#superclass : #Object,
	#instVars : [
		'func',
		'tempNames',
		'stackSize',
		'maxStackSize'
	],
	#category : 'SmiLang-compiler'
}

{ #category : #private }
SmiCompiler >> arithmeticSelectors [
	^ #(#+ #- #< #> #'<=' #'>=' #= #'~=' #* #/ #'\\' #@ #bitShift: #'//' #bitAnd: #bitOr:)
]

{ #category : #private }
SmiCompiler >> astFor: method [
	^ RBParser parseMethod: method sourceCode
]

{ #category : #private }
SmiCompiler >> callFunctionFor: selector [
	^ SmiCallFunction new
		function: (self class new compilePharoMethod: (SmiExamples compiledMethodAt: selector ifAbsent: [ (Smalltalk at: #SmiAdditionnalExamples)>>selector ]));
		yourself 
]

{ #category : #private }
SmiCompiler >> compileAST: ast [
	^ (self compileFunction: ast)
		funcName: ast selector;
		yourself
]

{ #category : #private }
SmiCompiler >> compileFunction: ast [
	self createNewFunction: ast.
	self generateInstructions: ast.
	self setFunctionParameters: ast.
	^ func
]

{ #category : #public }
SmiCompiler >> compilePharoMethod: method [
	^ self compileAST: (self astFor: method)
]

{ #category : #private }
SmiCompiler >> createNewFunction: ast [
	func := SmiFunction new.
	tempNames := self tempsFor: ast.
]

{ #category : #private }
SmiCompiler >> generateInstructions: ast [
	ast body statements do: [ :each | each acceptVisitor: self ].
]

{ #category : #initialization }
SmiCompiler >> initialize [

	super initialize.

	stackSize := 0.
	maxStackSize := 0.
]

{ #category : #stack }
SmiCompiler >> pop [
	self pop: 1
]

{ #category : #stack }
SmiCompiler >> pop: n [
	stackSize := stackSize - n
]

{ #category : #stack }
SmiCompiler >> push [
	stackSize := stackSize + 1.
	stackSize > maxStackSize ifTrue: [ maxStackSize := stackSize ]
]

{ #category : #private }
SmiCompiler >> pushOperationFor: name [
	^ SmiPushTemp new tempIndex: (self tempIndexFor: name)
]

{ #category : #private }
SmiCompiler >> setFunctionParameters: ast [
	func numArguments: ast arguments size.
	func numTemps: tempNames size - func numArguments.
	func stackSize: maxStackSize + tempNames size.
]

{ #category : #private }
SmiCompiler >> storeOperationFor: name [
	^ SmiStoreTemp new tempIndex: (self tempIndexFor: name)
]

{ #category : #private }
SmiCompiler >> tempIndexFor: tempName [
	^ tempNames 
		indexOf: tempName 
		ifAbsent: nil
]

{ #category : #private }
SmiCompiler >> tempsFor: ast [
	^ ast argumentNames , ast temporaryNames
]

{ #category : #visiting }
SmiCompiler >> visitAssignmentNode: assign [	
	assign value acceptVisitor: self.
	func addStackOperation: (self storeOperationFor: assign variable name).
	func addStackOperation: SmiPop new.
	self pop
]

{ #category : #visiting }
SmiCompiler >> visitLiteralNode: litValue [ 
	func addStackOperation: (SmiPushSmi new smi: litValue value).
	self push.
]

{ #category : #visiting }
SmiCompiler >> visitMessageNode: msg [	
	(self arithmeticSelectors includes: msg selector) 
		ifTrue: [ ^ self visitPrimitiveNode: msg ].
	msg arguments do: [ :arg | arg acceptVisitor: self ].
	func addStackOperation: (self callFunctionFor: msg selector).
	self pop: msg arguments size.
	self push
	
]

{ #category : #visiting }
SmiCompiler >> visitPrimitiveNode: msg [	
	msg receiver acceptVisitor: self.
	msg arguments do: [ :arg | arg acceptVisitor: self ].
	func addStackOperation: (SmiPrimitiveOperation new selector: msg selector).
	self pop: msg arguments size.
]

{ #category : #visiting }
SmiCompiler >> visitReturnNode: return [	
	return value acceptVisitor: self.
	func addStackOperation: SmiReturnTop new.
]

{ #category : #visiting }
SmiCompiler >> visitVariableNode: var [	
	func addStackOperation: (self pushOperationFor: var name).
	self push.
]
