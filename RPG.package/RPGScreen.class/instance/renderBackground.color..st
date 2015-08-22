as yet unclassified
renderBackground: anAthensCairoCanvas color: aColor 
	self flag: #todo. "Should be in model ?"
	anAthensCairoCanvas setShape: (0@0 corner: window extent).
	anAthensCairoCanvas setPaint: aColor.
	anAthensCairoCanvas draw