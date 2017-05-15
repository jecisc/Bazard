helper
compileSmiExample: numExamples
	^ self compilerClass new 
		compilePharoMethod: (self examplesMethodsSorted at: numExamples)
	