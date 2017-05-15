visiting
visitStoreTemp: node
	"There should be a location on stack to store this value"

	currentContext stackAt: node tempIndex put: currentContext top