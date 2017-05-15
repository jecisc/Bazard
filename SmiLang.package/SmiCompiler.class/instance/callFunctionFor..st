private
callFunctionFor: selector
	^ SmiCallFunction new
		function: (self class new compilePharoMethod: (SmiExamples compiledMethodAt: selector ifAbsent: [ (Smalltalk at: #SmiAdditionnalExamples)>>selector ]));
		yourself 