private
activateFunction: func
	"Sets up a new stack frame:
	push and update function, programCounter, framePointer and allocate space for temporaries"

	self push: currentFunction.
	currentFunction := func.
	self push: programCounter.
	programCounter := 0.
	self push: framePointer.
	framePointer := stackPointer.
	func numTemporaries timesRepeat: [ self push: 0 ]