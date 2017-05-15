private
createNewFunction: ast
	func := SmiFunction new.
	tempNames := self tempsFor: ast.