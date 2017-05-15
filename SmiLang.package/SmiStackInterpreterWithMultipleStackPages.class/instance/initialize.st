initialization
initialize

	super initialize.
 
	stackPages := self newStackPages.
	indexOfCurrentStackPage := 1.
	currentStackPage := stackPages at: indexOfCurrentStackPage