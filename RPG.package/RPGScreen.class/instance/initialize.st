initialization
initialize
	super initialize.
	self newWindow.
	surface := window newAthensRenderer. 
	scheduler := RPGScheduler newFor: self