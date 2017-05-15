private
compileAST: ast
	^ (self compileFunction: ast)
		funcName: ast selector;
		yourself