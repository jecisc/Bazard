private
generateInstructions: ast
	ast body statements do: [ :each | each acceptVisitor: self ].