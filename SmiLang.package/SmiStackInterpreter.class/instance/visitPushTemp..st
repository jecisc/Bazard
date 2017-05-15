visiting
visitPushTemp: node
	"Pushes the temp value relatively to the frame pointer.
	Depending if the index corresponds to an argument or a temporary,
	fetches the value before or after the framePointer"

	node tempIndex <= currentFunction numArgs
		ifFalse: [ self push: (currentStackPage at: framePointer - currentFunction numArgs + node tempIndex) ]
		ifTrue: [ self push: (currentStackPage at: framePointer - 3 - currentFunction numArgs + node tempIndex) ]