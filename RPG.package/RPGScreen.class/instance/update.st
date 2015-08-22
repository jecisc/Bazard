updating
update
	self flag: #todo. "improve! I'm naugty :3 I would be better if I update only the area that changes."
	surface athensSurface drawDuring: [ :canvas |
		model renderOn: canvas ].
	surface updateAll