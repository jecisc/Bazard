printing
printOn: s
	s << funcName.
	stackOperations withIndexDo: [ :op :index |
		s cr. 
		s tab.
		s nextPut: $<.
		s << index printString.
		s nextPut: $>.
		s space.
		op printOn: s ].