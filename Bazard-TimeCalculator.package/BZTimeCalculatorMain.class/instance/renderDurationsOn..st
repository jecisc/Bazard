rendering
renderDurationsOn: html
	html div
		mdlTypographyDisplay1;
		mdlTextColorPrimary;
		with: 'Départs : '.
	html
		form: [ durations
				doWithIndex: [ :duration :ind | 
					html label
						for: html nextId;
						with: 'Durée numéro ' , ind asString , ' : '.
					html timeInput5
						step: 1;
						id: html lastId;
						value: duration print24;
						onChange: (self updateLineAt: ind on: html);
						callback: [ :time | 
							durations
								at: ind
								put:
									([ Time fromString: time ]
										on: Error
										do: [ duration ]) ].
					html space.
					html div
						id: 'content' , ind asString;
						with: [ self renderResultFor: ind on: html ].
					html break ].
			html break ].
	html mdlButton
		fab;
		onClick:
			(html jQuery ajax
				callback: [ durations add: Time now ];
				onComplete: 'location.reload();');
		primaryColor;
		with: '+'