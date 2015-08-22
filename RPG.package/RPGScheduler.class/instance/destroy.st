initialization
destroy
	[ process terminate ] on: Error do: [:e | Transcript crShow: e message ].