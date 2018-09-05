Class {
	#name : #SPHeader,
	#superclass : #SPComponent,
	#category : #'Seaside-Presentation'
}

{ #category : #rendering }
SPHeader >> renderContentOn: html [
	html mdlLayoutHeader
		waterfall;
		with: [ html
				mdlLayoutHeaderRow: [ html mdlNavigationLink
						callback: [ "Just refresh" ];
						with: [ html
								mdlLayoutTitle: [ html image
										style: 'width: 40px; height: 40px;';
										url: (MDLDemoLibrary urlOf: 'logoSvg').
									html text: '    Developing the Seaside ecosystem to increase its productivity' ] ].
					html mdlLayoutSpacer.
					html text: 'ESUG 2018' ] ]
]
