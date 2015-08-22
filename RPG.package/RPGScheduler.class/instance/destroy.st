initialization
destroy
	[ process terminate ] on: Error do: [:e | Transcript crShow: e message ].
	Transcript crShow: 'Process end.'.
	process := nil.
	screen := nil