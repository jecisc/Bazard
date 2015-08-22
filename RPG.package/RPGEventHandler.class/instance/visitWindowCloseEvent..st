visiting
visitWindowCloseEvent: anEventhalt.
	Transcript crShow: 'Event: close.'.
	model closeGame.
	model := nil