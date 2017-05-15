Represent the activation of a SmiFunction
	function:		<SmiFunction>
	programCounter:		<Smi> index in function stackOperation of the operation being executed
	sender:		<SmiContext | nil> nil for top most context, else the context that activated this one (context to return to)
	stack:		<Array> its size depends on the function stackSize
	stackPointer:		<Smi> top of stack in the inst var stack

