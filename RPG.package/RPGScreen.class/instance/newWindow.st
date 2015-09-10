initialization
newWindow
	| attributes |
	attributes := OSWindowAttributes new.
	attributes title: self class title.
	attributes extent: 480@352.
	attributes position: 50@50. 
	window := OSWindow createWithAttributes: attributes.
	Transcript crShow: 'Open window.'