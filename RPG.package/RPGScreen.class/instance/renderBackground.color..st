as yet unclassified
renderBackground: anAthensCairoCanvas color: aColor 
	self flag: #todo. "Should be in model ?"
	anAthensCairoCanvas setShape: (0@0 corner: window extent).
	anAthensCairoCanvas setPaint: (PNGReadWriter formFromFileNamed: 'ressources/background2.png').
	anAthensCairoCanvas draw