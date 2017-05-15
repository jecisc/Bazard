visiting
visitMessageNode: msg	
	(self arithmeticSelectors includes: msg selector) 
		ifTrue: [ ^ self visitPrimitiveNode: msg ].
	msg arguments do: [ :arg | arg acceptVisitor: self ].
	func addStackOperation: (self callFunctionFor: msg selector).
	self pop: msg arguments size.
	self push
	