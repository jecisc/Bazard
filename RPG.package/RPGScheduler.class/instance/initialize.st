initialization
initialize
	super initialize.
	process := self newProcessAt: 30 do: [ screen update ] every: self timeBetweenRendering