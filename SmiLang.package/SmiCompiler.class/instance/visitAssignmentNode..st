visiting
visitAssignmentNode: assign	
	assign value acceptVisitor: self.
	func addStackOperation: (self storeOperationFor: assign variable name).
	func addStackOperation: SmiPop new.
	self pop