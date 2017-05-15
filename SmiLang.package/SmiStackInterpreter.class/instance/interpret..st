public
interpret: function
	self initializeStackFor: function.
	self interpret.
	^ currentStackPage first