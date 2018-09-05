Class {
	#name : #SPRoot,
	#superclass : #SPComponent,
	#instVars : [
		'header',
		'footer',
		'slides',
		'currentSlide'
	],
	#category : #'Seaside-Presentation'
}

{ #category : #testing }
SPRoot class >> canBeRoot [
	^ true
]

{ #category : #'class initialization' }
SPRoot class >> initialize [
	self environment at: #WADevelopmentConfiguration ifPresent: [ :class | WAAdmin applicationDefaults removeParent: class instance ].
	^ (WAAdmin register: self asApplicationAt: 'SeasidePresentation')
		preferenceAt: #sessionClass put: SPSession;
		addLibrary: JQDeploymentLibrary;
		addLibrary: MDLLibrary;
		yourself
]

{ #category : #accessing }
SPRoot >> currentSlide [
	^ currentSlide
]

{ #category : #accessing }
SPRoot >> currentSlide: anObject [
	currentSlide := anObject
]

{ #category : #components }
SPRoot >> defaultFooter [
	^ SPFooter new
]

{ #category : #components }
SPRoot >> defaultHeader [
	^ SPHeader new
]

{ #category : #accessing }
SPRoot >> footer [
	^ footer
]

{ #category : #accessing }
SPRoot >> footer: anObject [
	footer := anObject
]

{ #category : #accessing }
SPRoot >> header [
	^ header
]

{ #category : #accessing }
SPRoot >> header: anObject [
	header := anObject
]

{ #category : #initialization }
SPRoot >> initialize [
	super initialize.
	self header: self defaultHeader.
	self footer: self defaultFooter.
	self session rootComponent: self.
	self slides: OrderedCollection new.
	self initializeSlides.
	self currentSlide: 1
]

{ #category : #initialization }
SPRoot >> initializeSlides [
	self slides
		add: (SPSlide title: 'Bla1' content: [ :html | html text: 'Bla' ]);
		add: (SPSlide title: 'Bla2' content: [ :html | html text: 'Bla' ]);
		add: (SPSlide title: 'Bla3' content: [ :html | html text: 'Bla' ])
]

{ #category : #javascript }
SPRoot >> jsInitBackAndNextKeyboardEventsOn: html [
	html
		script:
			'document.onkeydown = function(e) {
    switch (e.keyCode) {
        case 37:
				document.getElementById("back").click()
            break;
        case 39:
            document.getElementById("next").click()
            break;
    }
};'
]

{ #category : #rendering }
SPRoot >> renderContentOn: html [
	html
		mdlLayout: [ html render: self header.
			html mdlLayoutContent
				class: 'mdl-color-text--grey-600';
				with: [ html mdlGrid
						noSpacing;
						style: 'height: calc(100% - 64px);';
						with: [ html mdlCell
								class: 'mdl-components';
								size: 12;
								with: [ html render: (self slides at: self currentSlide) ] ].
					html render: self footer ] ].
	self jsInitBackAndNextKeyboardEventsOn: html
]

{ #category : #accessing }
SPRoot >> slides [
	^ slides
]

{ #category : #accessing }
SPRoot >> slides: anObject [
	slides := anObject
]

{ #category : #accessing }
SPRoot >> totalNumberOfSlides [
	^ self slides size
]

{ #category : #updating }
SPRoot >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Seaside Presentation'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'.
	self updateTabIconRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: (WAUrl absolute: 'https://storage.googleapis.com/code.getmdl.io/1.3.0/material.deep_purple-pink.min.css')
]

{ #category : #updating }
SPRoot >> updateTabIconRoot: anHtmlRoot [
	anHtmlRoot link
		relationship: 'apple-touch-icon';
		attributeAt: 'sizes' put: '120x120';
		url: (MDLDemoLibrary urlOf: 'appleicon120x120Png').
	#('32x32' '16x16')
		do: [ :size | 
			anHtmlRoot link
				relationship: 'icon';
				type: 'image/png';
				url: (MDLDemoLibrary urlOf: 'favicon' , size , 'Png');
				attributeAt: 'sizes' put: size ].
	anHtmlRoot link
		relationship: 'manifest';
		url: (MDLDemoLibrary urlOf: 'siteWebmanifest').
	anHtmlRoot meta
		name: 'msapplication-TileColor';
		content: '#da532c'.
	anHtmlRoot link
		relationship: 'mask-icon';
		attributeAt: 'color' put: '#5bbad5';
		url: (MDLDemoLibrary urlOf: 'safaripinnedtabSvg').
	anHtmlRoot meta
		name: 'theme-color';
		content: '#ffffff'
]
