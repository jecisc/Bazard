stack
pop
	"should pop top of stack and return it"

	| res |
	
	res := currentStackPage at: stackPointer.
	currentStackPage at: stackPointer put: nil.
	stackPointer := stackPointer - 1.
	^ res