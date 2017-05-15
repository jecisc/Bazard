private
interpret
	[ currentContext function == #stopFlag ] whileFalse: [ 
		currentContext programCounter: currentContext programCounter + 1. 
		self interpretNextInstruction ]