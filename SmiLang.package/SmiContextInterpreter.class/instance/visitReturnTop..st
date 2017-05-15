visiting
visitReturnTop: node
	"Push the top of the stack on the currentContext sender stack
	and resume execution in the sender."
	
	| value |
	value := currentContext top.
	currentContext := currentContext sender.
	currentContext push: value