private
initialContext
	^ SmiContext new
		programCounter: 0;
		function: #stopFlag;
		initialContext;
		yourself