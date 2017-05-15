visiting
visitPrimitiveOperation: node
	"Use perform:with: to get the primitive result"

	| arg receiver |
	arg := currentContext pop.
	receiver := currentContext pop.
	currentContext push: (receiver perform: node selector with: arg)