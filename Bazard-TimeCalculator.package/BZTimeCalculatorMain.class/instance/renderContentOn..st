rendering
renderContentOn: html
	self renderArrivalTimeSelectionOn: html.
	html div
		id: #content;
		with: [ self renderDurationsOn: html ]