Extension { #name : #WAHtmlCanvas }

{ #category : #'*CV' }
WAHtmlCanvas >> bold [
	^ self tag: 'b'
]

{ #category : #'*CV' }
WAHtmlCanvas >> bold: aBlock [
	^ self bold with: aBlock
]
