initialization
initialize
	super initialize.
	self newWindow.
	scheduler := RPGScheduler newFor: self