visiting
visitCallFunction: node
	"probably calls activateFunction:"
	
	self activateFunction: node function 