visiting
visitStoreTemp: node
	"the temp referenced is necessarily a temporary and not an argument (language constraint).
	Store the top of stack relatively to a location relative to the framePointer.
	Does not pop the stack (stack pointer is the same at the end of this instruction than at the beginning)"

	currentStackPage at: framePointer + node tempIndex put: self top