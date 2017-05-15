visiting
visitLiteralNode: litValue 
	func addStackOperation: (SmiPushSmi new smi: litValue value).
	self push.