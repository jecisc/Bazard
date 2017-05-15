public
interpret: function
	currentContext := self initialContext.
	self newContextFor: function.
	self interpret.
	^ currentContext top