visiting
visitPushTemp: node
	"Fetches the value from the stack based on node tempIndex"

	currentContext push: (currentContext stackAt: node tempIndex)