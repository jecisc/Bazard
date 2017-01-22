initialization
initialize
	WAAdmin register: self at: 'deploy'.
	ZnConstants defaultMaximumEntitySize: 40 * 1024 * 1024