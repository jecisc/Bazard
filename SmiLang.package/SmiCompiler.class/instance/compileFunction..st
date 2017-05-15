private
compileFunction: ast
	self createNewFunction: ast.
	self generateInstructions: ast.
	self setFunctionParameters: ast.
	^ func