Class {
	#name : #BaselineOfSeasidePresentation,
	#superclass : #BaselineOf,
	#category : #BaselineOfSeasidePresentation
}

{ #category : #baselines }
BaselineOfSeasidePresentation >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Dependencies"
			self
				prism: spec;
				chartJs: spec;
				materialDesignLite: spec;
				telescopeCytoscape: spec.

			"Packages"
			spec package: #'Seaside-Presentation' with: [ spec requires: #('PrismCodeDisplayer' 'ChartJs' 'MaterialDesignLite' 'TelescopeCytoscape') ] ]
]

{ #category : #dependencies }
BaselineOfSeasidePresentation >> chartJs: spec [
	spec baseline: 'ChartJs' with: [ spec repository: 'github://DuneSt/ChartJs:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfSeasidePresentation >> materialDesignLite: spec [
	spec baseline: 'MaterialDesignLite' with: [ spec repository: 'github://DuneSt/MaterialDesignLite:development/src' ]
]

{ #category : #dependencies }
BaselineOfSeasidePresentation >> prism: spec [
	spec baseline: 'PrismCodeDisplayer' with: [ spec repository: 'github://DuneSt/PrismCodeDisplayer:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfSeasidePresentation >> telescopeCytoscape: spec [
	spec baseline: 'TelescopeCytoscape' with: [ spec repository: 'github://TelescopeSt/TelescopeCytoscape:v1.x.x/src' ]
]
