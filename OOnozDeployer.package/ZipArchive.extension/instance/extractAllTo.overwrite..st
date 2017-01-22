*OOnozDeployer
extractAllTo: aDirectory overwrite: allOverwrite
	"Extract all elements to the given directory"

	UIManager default
		informUserDuring: [ :bar | self extractAllTo: aDirectory informing: bar overwrite: allOverwrite ]