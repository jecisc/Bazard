rendering
renderContentOn: html
	begun
		ifTrue: [ html render: main ]
		ifFalse: [ html mdlAnchorButton
				callback: [ begun := true ];
				primaryColor;
				rippleEffect;
				raised;
				with: 'Commencer' ]