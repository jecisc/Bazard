initialization
initializeWithFunc: func
	function := func.
	stack := Array new: func stackSize.
	stack atAllPut: 0.
	stackPointer := 0