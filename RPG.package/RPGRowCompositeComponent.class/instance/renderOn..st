rendering
renderOn: anAthensCairoCanvas
	| space |
	self flag: #todo. "better handling of the space."
	space := 0.
	components do: [ :w | 
		w renderOn: anAthensCairoCanvas.
		anAthensCairoCanvas pathTransform translateX: space Y: 0 ].
	anAthensCairoCanvas pathTransform translateX: (space * components size negated) Y: 0.