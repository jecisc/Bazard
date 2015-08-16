initialization
newWindow
	| attributes |
	attributes := OSWindowAttributes new.
	attributes title: self class title.
	window := OSWindow createWithAttributes: attributes