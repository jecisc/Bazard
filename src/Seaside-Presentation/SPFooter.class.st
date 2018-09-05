Class {
	#name : #SPFooter,
	#superclass : #SPComponent,
	#category : #'Seaside-Presentation'
}

{ #category : #rendering }
SPFooter >> renderBackButtonOn: html [
	self renderButton: 'arrow_back' id: 'back' callback: [ self rootComponent currentSlide: (1 max: self rootComponent currentSlide - 1) ] on: html
]

{ #category : #rendering }
SPFooter >> renderButton: icon id: aString callback: callback on: html [
	html mdlAnchorButton
		icon;
		id: aString;
		callback: callback;
		with: [ html mdlIcon: icon ]
]

{ #category : #rendering }
SPFooter >> renderContentOn: html [
	html mdlMiniFooter
		style: 'max-height: 64px;padding: 14px 16px;';
		with: [ html mdlLayoutSpacer.
			html mdlMiniFooterLinkList
				style: 'font-size: 20px;color: white;';
				with: [ html listItem: [ self renderBackButtonOn: html ].
					html listItem: [ html text: self rootComponent currentSlide asString , ' / ' , self rootComponent totalNumberOfSlides asString ].
					html listItem: [ self renderNextButtonOn: html ] ].
			html mdlLayoutSpacer ]
]

{ #category : #rendering }
SPFooter >> renderNextButtonOn: html [
	self renderButton: 'arrow_forward' id: 'next' callback: [ self rootComponent currentSlide: (self rootComponent totalNumberOfSlides min: self rootComponent currentSlide + 1) ] on: html
]
