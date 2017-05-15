stack
pop
	stackPointer := stackPointer - 1.
	^ stack at: stackPointer + 1