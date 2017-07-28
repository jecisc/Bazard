class initialization
initialize
	(WAAdmin register: self asApplicationAt: 'timeCalculator')
		addLibrary: JQ2DeploymentLibrary;
		addLibrary: MDLLibrary