public
compilePharoMethod: method
	^ self compileAST: (self astFor: method)