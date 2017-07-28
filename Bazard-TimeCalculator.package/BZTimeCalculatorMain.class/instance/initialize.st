initialization
initialize
	super initialize.
	arrivalTime := DateAndTime now.
	durations := OrderedCollection with: (Time hour: 6 minute: 5 second: 10)