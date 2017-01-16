baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ self seaside3: spec.
			spec package: 'OOnozDeployer' with: [ spec requires: #('Seaside3') ] ]