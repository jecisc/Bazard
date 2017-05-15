visiting
visitReturnNode: return	
	return value acceptVisitor: self.
	func addStackOperation: SmiReturnTop new.