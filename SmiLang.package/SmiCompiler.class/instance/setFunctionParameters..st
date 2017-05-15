private
setFunctionParameters: ast
	func numArguments: ast arguments size.
	func numTemps: tempNames size - func numArguments.
	func stackSize: maxStackSize + tempNames size.