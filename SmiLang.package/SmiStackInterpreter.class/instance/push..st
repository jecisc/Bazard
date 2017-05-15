stack
push: elem
	"should push elem on top of stack"
	
	stackPointer := stackPointer + 1.
	currentStackPage at: stackPointer put: elem