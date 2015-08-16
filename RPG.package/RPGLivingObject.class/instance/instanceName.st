accessing
instanceName
	^ instanceName ifNil: [ self class defaultInstanceName ]