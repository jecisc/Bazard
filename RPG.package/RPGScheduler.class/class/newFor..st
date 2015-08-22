instance creation
newFor: aScreen
	^ self basicNew
		screen: aScreen;
		initialize;
		yourself