private
newContextFor: function
	| nextContext arguments |
	nextContext := SmiContext new
		initializeWithFunc: function;
		programCounter: 0;
		sender: currentContext;
		yourself.
	arguments := Array new: function numArguments.
	1 to: arguments size do: [ :i | arguments at: arguments size - i + 1 put: currentContext pop ].
	currentContext := nextContext.
	arguments do: [ :arg | currentContext push: arg ].
	1 to: function numTemps do: [ :ind | currentContext push: 0 ]

	"should set up a new currentContext:
	sender
	stack and stackPointer
	arguments and temporaries"