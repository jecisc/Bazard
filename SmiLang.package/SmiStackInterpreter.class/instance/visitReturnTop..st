visiting
visitReturnTop: node
	"Pop the current frame and push the function result.
	Restores programCounter, currentFunction and framePointer to sender frame"

	| res |
	res := self top.
	stackPointer := framePointer - 3 + currentFunction numArgs.
	programCounter := currentStackPage at: framePointer - 1.
	currentFunction := currentStackPage at: framePointer - 2.
	framePointer := currentStackPage at: framePointer.
	self push: res