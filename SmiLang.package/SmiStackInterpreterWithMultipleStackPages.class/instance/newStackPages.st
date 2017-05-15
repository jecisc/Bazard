initialization
newStackPages
	^ (1 to: self numStackPages) collect: [ :i | self newStackPage ]