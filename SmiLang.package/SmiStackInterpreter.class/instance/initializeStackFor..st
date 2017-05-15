initialization
initializeStackFor: function
	programCounter := #programCounterFlag.
	currentFunction := #functionFlag.
	framePointer := #framePointerFlag.
	self activateFunction: function