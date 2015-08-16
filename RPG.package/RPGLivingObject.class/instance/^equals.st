comparing
= anObject
	self flag: #todo. "test"
	self species = anObject species and: [ self instanceName = anObject instanceName ]