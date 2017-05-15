stack
push
	stackSize := stackSize + 1.
	stackSize > maxStackSize ifTrue: [ maxStackSize := stackSize ]