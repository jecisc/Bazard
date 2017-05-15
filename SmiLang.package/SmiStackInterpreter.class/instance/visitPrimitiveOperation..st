visiting
visitPrimitiveOperation: node
	"Use perform:with: to get the primitive result"

	| arg rec |
	arg := self pop.
	rec := self pop.
	self push: (rec perform: node selector with: arg)