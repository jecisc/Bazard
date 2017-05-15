stack
push: elem
	Halt if: [ elem isKindOf: SmiPushTemp ].
	stack at: (stackPointer := stackPointer + 1) put: elem