initialization
initialize
	super initialize.
	Transcript crShow: 'Process begin.'.
	process := self newProcessAt: 30 do: [ screen update ] every: self timeBetweenRendering