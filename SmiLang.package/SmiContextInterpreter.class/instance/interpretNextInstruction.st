private
interpretNextInstruction
	"should ask the current instruction to 'accept: self' to dispatch"

	(currentContext function stackOperationAt: currentContext programCounter) accept: self.
	Halt onCount: 1000	"You may use this code to halt on infinite loops"