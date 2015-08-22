initialization
newWindow
	| attributes |
	attributes := OSWindowAttributes new.
	attributes title: self class title.
	attributes extent: 640@480.
	attributes position: 50@50. 
	window := OSWindow createWithAttributes: attributes