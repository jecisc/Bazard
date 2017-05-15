private
interpretNextInstruction
	"Asks the currentInstruction to accept self"

	(currentFunction stackOperationAt: programCounter) accept: self.
	Halt onCount: 1000	"You may use this code to halt on infinite loops"