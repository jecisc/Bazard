visiting
visitPrimitiveNode: msg	
	msg receiver acceptVisitor: self.
	msg arguments do: [ :arg | arg acceptVisitor: self ].
	func addStackOperation: (SmiPrimitiveOperation new selector: msg selector).
	self pop: msg arguments size.