private
interpret
	[ currentFunction == #functionFlag ]
		whileFalse: [ programCounter := programCounter + 1.
			self interpretNextInstruction ]